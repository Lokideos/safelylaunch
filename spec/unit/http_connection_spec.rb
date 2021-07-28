# frozen_string_literal: true

RSpec.describe Safelylaunch::HttpConnection do
  subject(:conn) { described_class.new(api_token: api_token, logger: Logger.new(STDOUT)) }

  let(:api_token) { '123' }
  let(:response) { double(:response, body: {}) }

  describe '#get' do
    it { expect(conn.get('stream-toggle')).to eq("key": "stream-toggle", "enable": false)  }

    it 'uses cache if it is available' do
      expect(conn.connection).to receive(:get).once.and_return(response)
      conn.get('stream-toggle')

      expect(conn.connection).to_not receive(:get)
      conn.get('stream-toggle')
    end

    it { expect(conn.get('stream-toggle')).to eq(conn.get('stream-toggle')) }
  end
end
