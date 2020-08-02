#!/usr/bin/env ruby

# This is a fill-in-the-blank game.

# Example: "I decided to ______ a ______ party for my ______ ______."

# blanks = ['adjective', 'adjective', 'noun', 'verb']

# We will ask the user to give us two adjectives, a noun and a verb for the blank words in the sentence.

# We will record the users input and then return the output of the full sentence.

# So essentially we create a few random sentences, make some blanks of adjectives, nouns and verbs, and then we ask the user to input
# those things.

# When the application starts it shows its title which is: "Ruby Blanks"

# Then we will ask the user:

# Give me a verb: eat

# Give me an adjective: funny

# Give me an adjective: blue

# Give me a noun: bear

# Then we will return the entire sentence:

# "I decided to eat a funny party for my blue teddy bear."

# -------------------------------Code Start-----------------------------------#

puts "-------------------------"
puts "|\tRuby Blanks\t|"
puts "-------------------------"

sentences = [
    "I wanted to  a  for my  ", 
    "I decided to  a  for my  ", 
    "I didn't want to  a  for my  "
]

answers = {}

puts "Give me a verb:"
user_verb = gets.chomp
answers[:verb] = user_verb

puts "Give me an adjective:"
user_adjective_one = gets.chomp
answers[:adjective_1] = user_adjective_one

puts "Give me an adjective:"
user_adjective_two = gets.chomp
answers[:adjective_2] = user_adjective_two

puts "Give me a noun:"
user_noun = gets.chomp
answers[:noun] = user_noun

sentences = [
    "I wanted to #{answers[:verb]} a #{answers[:adjective_1]} get together for my #{answers[:adjective_2]} #{answers[:noun]}!",
    "I decided to #{answers[:verb]} a #{answers[:adjective_1]} prank for my #{answers[:adjective_2]} #{answers[:noun]}.",
    "I didn't want to #{answers[:verb]} a #{answers[:adjective_1]} party for my #{answers[:adjective_2]} #{answers[:noun]}."
]

puts sentences[rand(sentences.length)]