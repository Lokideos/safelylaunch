module Safelylaunch
  class MockConnection
    attr_reader :api_token, :logger, :host

    def initialize(api_token:, logger: Logger.new(STDOUT), host: 'http://localhost:2300')
      @api_token = api_token
      @logger = logger
      @host = host
    end

    def call
      build_connection
    end

    private

    def build_connection
      stubs = Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('/api/v1/check') { |_env| [200, {}, '{}'] }
      end

      Faraday.new(url: host, request: { timeout: 10 }) do |conn|
        conn.response :json, content_type: %r{application/json}, parser_options: { symbolize_names: true }
        conn.response :logger, logger: logger
        conn.adapter :test, stubs
      end
    end
  end
end
