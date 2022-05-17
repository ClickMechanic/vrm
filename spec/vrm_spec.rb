require 'spec_helper'

RSpec.describe Vrm do
  let(:test_vrm_string) { 'AB51ABC' }
  subject { described_class.new(test_vrm_string) }

  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.from' do
    context 'when passed a string' do
      it 'returns a new vrm' do
        expect(described_class.from(test_vrm_string)).to be_a(described_class)
      end
    end

    context 'when passed a Vrm' do
      it 'returns the vrm' do
        expect(described_class.from(subject)).to be(subject)
      end
    end
  end

  describe '#formatted' do

    it 'returns the result from the VRM formatter' do
      allow(Vrm::Formatter).to receive(:format).with(test_vrm_string).and_return 'formatted_test_string'
      expect(subject.formatted).to eq 'formatted_test_string'
    end
  end

  describe '#valid?' do

    it 'returns the result from the VRM validator' do
      allow(Vrm::Validator).to receive(:valid?).with(test_vrm_string).and_return true
      expect(subject.valid?).to eq true
    end

  end

  describe '#to_s' do
    it 'returns the original string' do
      expect(subject.to_s).to eq(test_vrm_string)
    end
  end

  describe '#==' do
    let(:test_vrm_string) { 'ab 51ABC' }
    let(:other_vrm_string) { 'AB51 abc' }
    let(:other_vrm) { described_class.from(other_vrm_string) }

    it 'compares formatted VRMs' do
      expect(subject).to eq other_vrm
    end

    context 'when VRMs are different' do
      let(:other_vrm_string) { 'ab 51ABD' }
      it { is_expected.not_to eq other_vrm }
    end
  end
end
