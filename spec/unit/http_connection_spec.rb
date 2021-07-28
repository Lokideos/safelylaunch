# frozen_string_literal: true

RSpec.describe Safelylaunch::HttpConnection do
  subject(:conn) { described_class.new(api_token: api_token) }

  let(:api_token) { '123' }

  describe '#get' do
    it { expect(conn.get('stream-toggle ')).to eq("key": "stream-toggle", "enable": false)  }
  end
end
