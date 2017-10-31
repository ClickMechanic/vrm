class Vrm
  module Validator

    VALIDATOR_REGEX = /
    (?<Current>^[A-Z]{2}[0-9]{2}[A-Z]{3}$)|
    (?<Prefix>^[A-Z][0-9]{1,3}[A-Z]{3}$)|
    (?<Suffix>^[A-Z]{3}[0-9]{1,3}[A-Z]$)|
    (?<DatelessLongNumberPrefix>^[0-9]{1,4}[A-Z]{1,2}$)|
    (?<DatelessShortNumberPrefix>^[0-9]{1,3}[A-Z]{1,3}$)|
    (?<DatelessLongNumberSuffix>^[A-Z]{1,2}[0-9]{1,4}$)|
    (?<DatelessShortNumberSuffix>^[A-Z]{1,3}[0-9]{1,3}$)|
    (?<NorthernIreland>^[A-Z]{1,3}[0-9]{1,4}$)
  /x

    def self.valid?(vrm)
      !!(vrm =~ VALIDATOR_REGEX)
    end

  end
end
