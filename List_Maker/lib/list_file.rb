#!/usr/bin/env ruby
require 'pry'
module ListMaker
    class ListFile
      
      @@filename = 'lm_list.txt'
      @@filepath = File.join(File.dirname(__FILE__), @@filename)
      
      def initialize
        # locate list file in APP_ROOT

        if file = File.exist?(@@filepath)
        #   confirm that it is readable and writable
          if File.readable?(@@filename) && File.writable?(@@filename)
            return file
          end
        else
          # or create a new file in APP_ROOT
          # Use File.new/open in write mode
          # if success, return self, otherwise exit program
          file = File.new(@@filepath, 'w')
          file.close
        end
      end
      
      def view
        puts "\nView List\n\n".upcase
        # Read from list file
        # Use File.new/open in read mode
        File.open(@@filepath, 'r') do |f|
          i = 1
          f.each_line do |line|
            puts "#{i}: #{line}"
            i += 1
            # add numbers next to list items
          end
        end
      end
      
      def add
        puts "\nAdd a List Item\n\n".upcase
        # Add item to the end of the list.
        # Use File.new/open in append mode
        puts "Enter the new list item and hit Return: "
        response = gets.chomp

        File.open(@@filepath, 'a') do |f|
          f.puts response
        end
      end
      
      def edit(number)
        puts "\nEdit a List Item\n\n".upcase
        # get the item position from the args ("edit 3", "edit 7")
        position = number.first.to_i - 1
        # read list file and make sure that item exists
        #   Use File.readlines
        array = File.readlines(@@filepath)
        if array[position] == nil
          puts "No Item Found"
        else
          puts "You have selected: #{array[position]}"
          puts "To edit, enter the new text and hit Return: "
        response = gets

        array[position] = response
        new_data = array.join
        File.write(@@filepath, new_data)
        end
      
        # return not found message if item does not exist
        # output text of current list item again
        # ask user to type new text
        # write list file with the new updated list
        #   Use File.write
      end
    end
end