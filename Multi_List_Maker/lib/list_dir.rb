module ListMaker
  class ListDir
    
    @@dirname = 'lm_lists'
    @@filepath = File.join("..", 'lm_lists')

    def self.dirname
      @@dirname
    end
    
    attr_reader :files
    
    def initialize
      # Find directory or create if it doesn't exist
      # locate list directory in APP_ROOT
      #   confirm that it is readable and writable
        array_of_files_and_directories_in_the_parent_directory = Dir.glob("..**/*")
        if array_of_files_and_directories_in_the_parent_directory.find{|d| d == @@filepath}
          if File.readable?(@@filepath) && File.writable?(@@filepath)
            refresh_cached_files
            return self
          end
        else
      # or create a new directory in APP_ROOT
      #   Use Dir.mkdir
          new_directory = Dir.mkdir(@@filepath)
      # Refresh cached files
          refresh_cached_files
          return self
      # if success, return self, otherwise exit program
        end
    end
    
    def choose_list
      # Display list of files with numbers
      i = 1
      @files.each do |f| 
        puts "#{i}: #{f}"
        i+=1
      end
      # Ask user to choose a number
      print "Choose a number: "
      user_input = gets.chomp.to_i
      position = user_input - 1

      if !@files[position]
        # Default to first file if user data is invalid
        puts "That doesn't exist. Here is the first file: #{@files.first}\n"
        puts "Enter 'add' to add a new list or 'quit' to quit:\n"
        resp = gets.chomp

        case resp
          # User can also type 'add' to add a new list
        when 'add'
          print "Enter a name for the list: "
          new_list_name = gets.chomp
          filepath = File.join(@@filepath, new_list_name)
          file = File.new(filepath, "w")
          refresh_cached_files
          new_list_name
        when 'quit'
          abort
        end
      else
        puts @files[position]
        return @files[position]
      end
      # Return filename so it can be loaded by ListFile
    end
    
    def list
      puts "-" * 60
      @files.each_with_index do |filename, i|
        puts "#{i+1}: #{filename}"
      end
      puts "-" * 60
    end
    
    def add
      # Ask user to provide a new file name and create it
      puts "Enter the filename you would like to use."
      puts "Names should be lowercase with underscores."
      puts "Example: grocery_list.txt"
      print "> "

      # Ensure file name ends in '.txt'
      # Create new file
      # Refresh cached files (or add filename to @files)
      # Return filename so it can be loaded by ListFile
    end
    
    def refresh_cached_files
      # Store the list of the files in this directory in @files
        @files = Dir.entries(@@filepath)
        @files.shift(2)
        @files
      # Use Dir.entries or Dir.glob
      # Be sure not to include "." files or directories
      # Only return filenames, not absolute or relative paths
    end
    
  end
end

# __FILE__ contains the relative path to the current file from the current execution directory
# File.expand_path(__FILE__) -> expand_path returns an absolute path to the file.

# File.dirname(__FILE__) returns the directory of the file you are in.
# File.expand_path(File.dirname(__FILE__)) -> Gives an absolute path to the directory you are in