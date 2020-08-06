#!/usr/bin/env ruby
class RadioError < StandardError

    attr_reader :volume

    def initialize(msg, volume)
        super(msg || "Error")
        @volume = volume
    end

end