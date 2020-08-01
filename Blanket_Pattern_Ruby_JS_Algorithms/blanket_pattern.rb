string = "RRGGBBYYKK"
# string = "++*~~*++*"

# We want to create a blanket pattern by outputting each result.
# A blanket pattern is one where each first letter in the string is removed and placed at the end of the string over and over again,
# until R becomes the first letter again.

# Here Are the ruby string methods: https://ruby-doc.org/core-2.6/String.html

# If you wanted to not destructively alter the original string, you can create a new variable that holds the original string.

# new_string = string.slice(0..-1) 

# NOTE -> You DO have to slice from the original string,
# otherwise you will modify the original string, even though you created a new variable to hold the original string.

# 20.times do
#     puts new_string
#     character = new_string.slice!(0)
#     new_string.concat(character)
# end

20.times do
    puts string
    character = string.slice!(0)
    string.concat(character)
end

# What does slice do? It deletes the first letter of the string and gives it back as the return value.
# How is .slice and .slice! different? slice removes it non-destructively, slice will modify the original string.
# What does concat do? it joins together. The string joins together the new character at the end of the string.