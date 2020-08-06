#!/usr/bin/env ruby
class ShiftCipher

    @@alphabet = [*'a'..'z']

    def self.encode(plain_string, number)
        # Take string argument & the number of how many places to the right you will shift the letter in the alphabet
        # We need to replace the letters in the string with different letters in the alphabet based on the number argument
        # how do we replace letters? 
        # First we can iterate over the string with each_char, then with the .replace method, which will replace a letter in the string.

        # This won't work though, because:

        # 1. We have to downcase the string, because the letters in the class variable @@alphabet are all lowercase.
        
        downcased_string = plain_string.downcase

        string_splitted_into_array = downcased_string.split("")

        filtered_string_array = string_splitted_into_array.map do |c|

            # 2. We need to find the index of where the letter is in the class variable @@alpabet

            if c == " "
                " "
            else

            index_of_alphabet_character = @@alphabet.index(c)

            # 3. We need to move it over as many times as the num argument wants

            modulo_index = index_of_alphabet_character + number % 26
            
            letter_to_replace = @@alphabet[modulo_index]

            c = (letter_to_replace)

            end

            # 4. The alphabet ends at 'z.' You need to keep the alphabet placement going, even past 'z'. You have to use negative values
            # in order to start the array over.

        end
        filtered_string_array.join("").capitalize
    end

    def self.decode(plain_string, number)
        downcased_string = plain_string.downcase
        string_splitted_into_array = downcased_string.split("")
        filtered_string_array = string_splitted_into_array.map do |c|
            if c == " "
                " "
            else
            index_of_alphabet_character = @@alphabet.index(c)
            modulo_index = index_of_alphabet_character - number % 26
            letter_to_replace = @@alphabet[modulo_index]
            c = (letter_to_replace)
            end
        end
        filtered_string_array.join("").capitalize
    end

end