require_relative 'vrm/version'
require_relative 'vrm/formatter'
require_relative 'vrm/validator'

class Vrm

  def self.from(vrm)
    vrm.is_a?(Vrm) ? vrm : Vrm.new(vrm)
  end

  def initialize(vrm)
    @vrm = vrm
  end

  def valid?
    Validator.valid?(formatted)
  end

  def formatted
    @formatted ||= Formatter.format(vrm)
  end

  def to_s
    vrm
  end

  def ==(other)
    formatted == self.class.from(other).formatted
  end

  private

  attr_reader :vrm

end
