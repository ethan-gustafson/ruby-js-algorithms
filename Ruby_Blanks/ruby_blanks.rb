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

puts "-" * 24
puts "|\tRuby Blanks\t|"
puts "-" * 24

blanks = ['verb', 'adjective', 'second adjective', 'noun']
vowels = ["a", "e", "i", "o", "u"]
answers = {}

blanks.each do |word|
    vowel = vowels.include?(word[0]) ? "an" : "a" 
    puts "Give me #{vowel} #{word}:"
    user_input = gets.strip
    answers["#{word}"] = user_input
end

sentences = [
    "I wanted to #{answers["verb"]} a #{answers["adjective"]} get together for my #{answers["second adjective"]} #{answers["noun"]}!",
    "I decided to #{answers["verb"]} a #{answers["adjective"]} prank for my #{answers["second adjective"]} #{answers["noun"]}.",
    "I didn't want to #{answers["verb"]} a #{answers["adjective"]} party for my #{answers["second adjective"]} #{answers["noun"]}."
]

puts sentences[rand(sentences.length)]