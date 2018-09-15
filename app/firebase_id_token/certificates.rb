module FirebaseIdToken
  class Certificates
    attr_reader :redis
    attr_reader :local_certs

    # Google's x509 certificates API URL.
    URL = 'https://www.googleapis.com/robot/v1/metadata/x509/'\
      'securetoken@system.gserviceaccount.com'

    def self.request
      new.request
    end

    def self.request!
      new.request!
    end

    def self.request_anyway
      warn 'WARNING: FirebaseIdToken::Certificates.request_anyway is '\
        'deprecated. Use FirebaseIdToken::Certificates.request! instead.'

      new.request!
    end

    def self.present?
      ! new.local_certs.empty?
    end

    def self.all
      new.local_certs.map { |kid, cert|
        { kid => OpenSSL::X509::Certificate.new(cert) } }
    end

    def self.find(kid)
      certs = new.local_certs
      raise Exceptions::NoCertificatesError if certs.empty?

      if certs[kid]
        OpenSSL::X509::Certificate.new certs[kid]
      end
    end

    def self.ttl
      ttl = new.redis.ttl('certificates')
      ttl < 0 ? 0 : ttl
    end

    def initialize
      @redis = Redis::Namespace.new('firebase_id_token',
        redis: FirebaseIdToken.configuration.redis)
      @local_certs = read_certificates
    end

    def request
      request! if @local_certs.empty?
    end

    def request!
      @request = HTTParty.get URL
      code = @request.code
      if code == 200
        save_certificates
      else
        raise Exceptions::CertificatesRequestError.new(code)
      end
    end

    private

    def read_certificates
      certs = @redis.get 'certificates'
      certs ? JSON.parse(certs) : {}
    end

    def save_certificates
      @redis.setex 'certificates', ttl, @request.body
      @local_certs = read_certificates
    end

    def ttl
      cache_control = @request.headers['cache-control']
      ttl = cache_control.match(/max-age=([0-9]+)/).captures.first.to_i

      if ttl > 3600
        ttl
      else
        raise Exceptions::CertificatesTtlError
      end
    end
  end
end