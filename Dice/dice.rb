#!/usr/bin/env ruby

class Dice

    attr_reader :value

    def initialize
        roll
    end

    def roll
        @value = random_number
    end

    private

    def random_number
        rand(1..6)
    end

end