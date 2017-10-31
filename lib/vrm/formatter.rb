class Vrm
  module Formatter

    def self.format(vrm)
      vrm&.upcase&.gsub(' ', '')
    end

  end
end
