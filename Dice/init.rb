#!/usr/bin/env ruby

require_relative 'dice'
require_relative 'dice_set'

puts "-" * 24
puts "Welcome to the Dice Roller"
puts "-" * 24

dice = DiceSet.new

dice.display

input = " "

while input != "exit"
    puts "\nType 'r' to go again, type 'exit' or 'q' to quit.\n"
    input = gets.chomp

    case input

    when "r"
        dice.roll
        dice.display
    when "Q", "q"
        exit
    end
end