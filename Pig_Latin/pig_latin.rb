#!/usr/bin/env ruby

# The challenge is to write a Ruby Script that converts one word into pig latin.

# Pig Latin is where words are converted into alternative versions according to a simple set of rules.

# The rules for Pig Latin are:

# 1. If the word begins with a consonant(a basic speech sound in which the breath is at least partly obstructed
# and which can be combined with a vowel to form a syllable.), the consonant moves to the end of the word, followed by "ay".
# Examples: 
# - "pig" => "igpay"
# - "latin" => "atinlay"

# 2. If the word begins with a vowel sound, ONLY add "ay" to the end of the word.
# Examples:
# - "elevator" => "elevatory"

# 3. If the word begins with a consonant cluster(multiple consonants), the whole cluster moves to the end, followed by "ay".
# Examples: 
# - "glove" => "oveglay"
# - "where" => "erewhay"

# A consonant cluster is just all of the letters that come before the first vowel.
# Y is an honorary vowel. If it is at the front of a word before a vowel, it is considered a consonant. If it is
# in the middle of the word, it is a vowel.

# For this challenge, just regard Y as a consonant.

def word_pig_latinizer(word)
    vowels = ["a", "e", "i", "o", "u"]
    # vowels = "aeiou"
    # consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n" "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    # consonants = "bcdfghjklmnpqrstvwxyz"

    splitted_word = word.downcase.split("")

    # We need to iterate through the word argument and stop at the first vowel
    # We need to find the index in the word, where the vowels include a vowel in the argument word.

    vowel_index = splitted_word.index{|letter| vowels.include?(letter)}

    # The index method allows you to iterate through an array. It is also a string method that accepts an argument.
    # The .include? method only returns a boolean value. 
    # So this iteration will find the index of the argument where the vowels includes the vowel of word argument.

    # if the vowel index is == 0
        # join the array and concat "ay"
    # else
        # iterate through the splitted_word array and shift the elements before the vowel and push them onto the end.
        # then join the string and add "ay"
    # end

    if vowel_index == 0 # if the vowel is at the beginning of the word, just add "ay" and return the string.
        splitted_word.join("").capitalize + "ay"
    else # else, we will shift off the number of letters before the vowel.
        shifter = splitted_word.shift(vowel_index) 
        # if the vowel index is 1, shift will just remove the first element of the array which is actually before the vowel index.
        # shift does not remove elements based on their array index. They remove based on how many elements you want to remove from the start of the array.
        splitted_word.push(shifter) # we will add the consonants to the end of the array
        finished_word = splitted_word.join("").capitalize + "ay" # we will join the array and add "ay"
    end

end

puts word_pig_latinizer("latin")
