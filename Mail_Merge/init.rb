#!/usr/bin/env ruby
require 'erb'
require 'csv'
# require 'pry'

#### Mail Merge ####
#
# Launch this Ruby file from the command line
# to get started
# 

APP_ROOT = File.expand_path(File.dirname(__FILE__))

# Read a template file containing the text of a letter
template = File.read("letter_template.txt")
# Read a CSV file to get an array of people
array_of_arrays = CSV.read("us_presidents.csv")
# Set instance variables to data for each person, by using csv methods
labels = array_of_arrays[0].map{|item| item.downcase.gsub(/\s/, '_')}

array_of_arrays.shift(1)

array_of_hashes = array_of_arrays.map do |row|
    labels.zip(row).to_h
end

array_of_hashes.each do |hash|
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @title = hash["party"]
    @due_date = hash["end"]
    @fee = "$#{rand(1..1000000)}.00"

    filename = File.join(".", "letters", "letter_#{@first_name}_#{@last_name}.txt")
    file = File.new(filename, "w")
    file << ERB.new(template).result(binding)
end

# binding.pry

# Use ERB to bind instance variables to the letter template

# Save the results as separate files in a directory (e.g., "letter_01.txt")
