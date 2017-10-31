require 'spec_helper'

RSpec.describe Vrm::Validator do

  describe '.valid?' do

    context 'when initialized with a valid, formatted VRM' do
      %w(AB51ABC A123ABC ABC123A 1ABC ABC1 1234AB AB1234 AAZ1 AAZ12 AAZ123 AAZ1234).each do |vrm|
        it "is valid with vrm: #{vrm}" do
          expect(described_class.valid?(vrm)).to eq true
        end
      end
    end

    context 'when initialized with an invalid VRM' do
      ['A', '1', 'ABCDEFG 123', '$%^', 'a123 abc', 'a123abc'].each do |invalid_vrm|
        it "is invalid with vrm: #{invalid_vrm}" do
          expect(described_class.valid?(invalid_vrm)).to eq false
        end
      end
    end
  end
end
