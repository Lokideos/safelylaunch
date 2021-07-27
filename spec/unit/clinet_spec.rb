# frozen_string_literal: true

RSpec.describe Safelylaunch::Client do
  subject(:client) { described_class.new(conn) }

  let(:conn) { Safelylaunch::MockConnection.new(api_token: api_token, logger: Logger.new(STDOUT)) }
  let(:api_token) { '123' }

  describe '#enable?' do
    it { expect(client.enable?('some-key')).to be_falsey }
  end
end
