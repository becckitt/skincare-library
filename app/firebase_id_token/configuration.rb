module FirebaseIdToken
  class Configuration
    attr_accessor :redis, :project_ids, :certificates

    def initialize
      @redis = Redis.new
      @project_ids = []
      @certificates = FirebaseIdToken::Certificates
    end
  end
end