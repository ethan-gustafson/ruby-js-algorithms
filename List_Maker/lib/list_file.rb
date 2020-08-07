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
        end
      end
      
      def view
        puts "\nView List\n\n".upcase
        # Read from list file
        # Use File.new/open in read mode
        File.open(@@filepath, 'r') do |f|
          i = 0
          f.each_line do |line|
            puts "#{i}: #{line}"
            i += 1
            # add numbers next to list items
          end
        end
      end
      
      def add(args=[])
        puts "\nAdd a List Item\n\n".upcase
        # Add item to the end of the list.
        # Use File.new/open in append mode
        File.open(@@filepath, 'a') do |f|
          if args.is_a?(Array)
            args.each do |a|
              f.puts a
            end
          else
            splitted = args.split(" ")
            splitted.each do |a|
              f.puts a
            end
          end
        end
      end
      
      def edit(args=[])
        puts "\nEdit a List Item\n\n".upcase
        # get the item position from the args ("edit 3", "edit 7")
        # position = args.first.to_i
        # read list file and make sure that item exists
        #   Use File.readlines
        array = File.readlines(@@filepath)
        file = File.read(@@filepath)

        args.each do |arg|
          if !array.find{|a| a == array[arg]}

            puts "Item Not Found"
            self.view
  
            puts "Add an item?\n"
            new_arg = gets.chomp
            self.add(new_arg)
            abort

          else

            File.open(@@filepath, 'r') do |f|
              i = 0
              f.each_line do |line|
                puts "#{i}: #{line}"
                i += 1
                # add numbers next to list items
              end
            end

            print "#{arg}: "
            edit_item = gets.chomp
            array[arg] = edit_item

            data = array.join
            File.write(@@filepath, data)
          end
        end
        # return not found message if item does not exist
        # output text of current list item again
        # ask user to type new text
        # write list file with the new updated list
        #   Use File.write
      end
    end
end
  
list = ListMaker::ListFile.new
list.add(["Item_1"])
list.edit([0])