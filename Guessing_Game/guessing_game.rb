#!/usr/bin/env ruby

puts "\nWhat is your name?\n\n"
input = gets

puts "\nHello #{input.chomp}!\n\n - This is a guessing game. Here are the rules:\n"
puts "\n1. The game will pick a random number from 1-10.\n\n2. You will try to guess the number.\n\n3. You only have three tries.\n\n"
puts "\nIf you wish to quit, type '0'.\n"
puts "\n*Go ahead and pick a number*\n"

random_number = rand(10) + 1 # Picks a random number from 1 - 10

MAX_GUESSES = 3

1.upto(MAX_GUESSES).each do |guess_number|
    puts "\nGuess #{guess_number}: "

    guess = gets.chomp.to_i
    
    case guess
    
    when random_number
        abort("Congrats! Your guess was: #{random_number} and it was correct!")
    when 0
        abort("Thanks for playing!")
    else
        puts "\nIncorrect!\n\n"
        guess
    end

    if guess_number == MAX_GUESSES
        puts "That was your last guess. Thanks for playing!"
    end
end