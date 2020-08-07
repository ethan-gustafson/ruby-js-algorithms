module ListMaker
  class ListFile
    
    @@filename = 'lm_list.txt'
    
    def initialize(filename="")
      filename ||= @@filename
      # locate list file in APP_ROOT
      dirname = ListMaker::ListDir.dirname
      @filepath = File.join(APP_ROOT, dirname, filename)
      if File.exists?(@filepath)
        # confirm that it is readable and writable
        if !File.readable?(@filepath)
          abort("List file exists but is not readable.")
        end
        if !File.writable?(@filepath)
          abort("List file exists but is not writable.")
        end
      else
        # or create a new file in APP_ROOT
        #   Use File.new/open in write mode
        File.open(@filepath, 'w')
        if !File.exists?(@filepath)
          abort("List file does not exist and could not be created.")
        end
      end
      # if success, return self, otherwise exit program
      self
    end
    
    def view
      puts "\nView List\n\n".upcase
      # Read from list file
      # Use File.new/open in read mode
      # add numbers next to list items
      file = File.new(@filepath, 'r')
      file.each_line.with_index do |line, i|
        puts "#{i+1}: #{line}"
      end
      file.close
    end
    
    def add
      puts "\nAdd a List Item\n\n".upcase
      # Add item to the end of the list.
      # Use File.new/open in append mode
      puts "Enter the new list item and hit return."
      print "> "
      new_item = gets.chomp
      File.open(@filepath, 'a') do |file|
        file << new_item
        file << "\n" # Because we used #chomp above
      end
    end
    
    def edit(args=[])
      puts "\nEdit a List Item\n\n".upcase
      # get the item position from the args ("edit 3", "edit 7")
      position = args.first.to_i
      if position < 1
        puts "Include the number of the item to edit."
        puts "Example: edit 3"
        return
      end
      # read list file and make sure that item exists
      #   Use File.readlines
      # return not found message if item does not exist
      lines = File.readlines(@filepath)
      if lines[position-1].nil?
        puts "Invalid item position."
        return
      end
      # output text of current list item again
      # ask user to type new text
      puts "Enter the new text and hit return."
      puts "#{position}: #{lines[position-1]}"
      print "> "
      new_item = gets
      # write list file with the new updated list
      #   Use File.write
      lines[position-1] = new_item
      data = lines.join
      File.write(@filepath, data)
      puts "List updated."
    end
    
  end
end
