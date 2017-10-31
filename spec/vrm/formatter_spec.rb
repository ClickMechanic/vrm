require 'spec_helper'

RSpec.describe Vrm::Formatter do

  describe '.formatted' do
    subject { described_class.format(test_vrm_string) }

    context 'when VRM contains lower case' do
      let(:test_vrm_string) { 'ab51abc' }

      it 'upcases the vrm' do
        expect(subject).to eq(test_vrm_string.upcase)
      end
    end

    context 'when VRM contains spaces' do
      let(:test_vrm_string) { 'AB51 ABC' }

      it 'removes them' do
        expect(subject).to eq(test_vrm_string.gsub(' ', ''))
      end
    end
  end
end
