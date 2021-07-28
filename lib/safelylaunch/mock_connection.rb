module Safelylaunch
  class MockConnection
    attr_reader :api_token, :logger, :host, :connection

    def initialize(api_token:, logger: Logger.new(STDOUT), host: 'http://localhost:2300')
      @api_token = api_token
      @logger = logger
      @host = host
      @connection = nil
    end

    def get(_key)
      { "key": "stream-toggle", "enable": false }
    end
  end
end
