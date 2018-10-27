module FirebaseIdToken
  class Signature
    # Pre-default JWT algorithm parameters as recommended
    # [here](https://goo.gl/uOK5Jx).
    JWT_DEFAULTS = { algorithm: 'RS256'}

    def self.verify(jwt_token)
      new(jwt_token).verify
    end

    attr_accessor :firebase_id_token_certificates

    def initialize(jwt_token)
      @project_ids = FirebaseIdToken.configuration.project_ids
      @kid = extract_kid(jwt_token)
      @jwt_token = jwt_token
      @firebase_id_token_certificates = FirebaseIdToken.configuration.certificates
    end
    
    def verify
      certificate = @firebase_id_token_certificates.find(@kid)
      if certificate
        payload = decode_jwt_payload(@jwt_token, certificate.public_key)
        authorize payload
      end
    end

    private

    def extract_kid(jwt_token)
      JWT.decode(jwt_token, nil, false).last['kid']
    # rescue StandardError
    #   'none'
    end

    def decode_jwt_payload(token, cert_key)
      JWT.decode(token, cert_key, true, JWT_DEFAULTS).first
      # rescue StandardError => e
      #   raise e
    end

    def authorize(payload)
      if payload && authorized?(payload)
        payload
      end
    end

    def authorized?(payload)
      still_valid?(payload) &&
      @project_ids.include?(payload['aud']) &&
      issuer_authorized?(payload) &&
      ! payload['sub'].empty?
    end

    def still_valid?(payload)
      true
      # payload['exp'].to_i > Time.now.to_i &&
      # payload['iat'].to_i <= Time.now.to_i
    end

    def issuer_authorized?(payload)
      issuers = @project_ids.map { |i| "https://securetoken.google.com/#{i}" }
      issuers.include? payload['iss']
    end
  end
end