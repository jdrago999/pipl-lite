require 'spec_helper'

describe Pipl::Lite do
  before do
    described_class.reset_key!
  end
  describe '.configure(key:)' do
    it 'configures the Pipl::Lite package' do
      key = SecureRandom.uuid
      described_class.configure(key: key)
      expect(described_class.key).to eq(key)
    end
  end
  describe '.search(args={})' do
    context 'when it is not yet confiured' do
      it 'raises an exception' do
        expect{described_class.search(raw_name: 'Clark Kent')}.to raise_error Pipl::Lite::NotConfiguredError
      end
    end
    context 'when it has been configured' do
      before do
        @key = SecureRandom.uuid
        described_class.configure(key: @key)
      end
      it 'searches with the keys provided' do
        expect(described_class).to receive(:get).with('https://api.pipl.com/search?raw_name=Clark+Kent&key=%s' % @key) do
          OpenStruct.new(
            code: 200,
            body: {
              possible_persons: [
                {
                  :@match => 0.5
                }
              ]
            }.to_json
          )
        end
        described_class.search(raw_name: 'Clark Kent')
      end
      context 'when it receives an error response' do
        before do
          expect(described_class).to receive(:get) do
            OpenStruct.new(code: 401)
          end
        end
        it 'raises an exception' do
        expect{described_class.search(raw_name: 'Clark Kent')}.to raise_error Pipl::Lite::ResponseError
        end
      end
    end
  end
end
