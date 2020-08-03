#!/usr/bin/env ruby
require_relative 'dice'

class DiceSet

    def initialize
        @set = [Dice.new, Dice.new]
    end

    def roll
        @set.each{|dice| dice.roll }
    end

    def display
        puts "\n[#{@set[0].value}] - [#{@set[1].value}]"
    end

end