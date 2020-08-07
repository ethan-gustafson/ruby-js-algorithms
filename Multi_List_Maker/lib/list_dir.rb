module ListMaker
  class ListDir
    
    @@dirname = 'lm_lists'

    def self.dirname
      @@dirname
    end
    
    attr_reader :files
    
    def initialize
      # Find directory or create if it doesn't exist
      # locate list directory in APP_ROOT
      #   confirm that it is readable and writable
      # or create a new directory in APP_ROOT
      #   Use Dir.mkdir
      # Refresh cached files
      # if success, return self, otherwise exit program
    end
    
    def choose_list
      # Display list of files with numbers
      # Ask user to choose a number
      # User can also type 'add' to add a new list
      # Default to first file if user data is invalid
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
      # Use Dir.entries or Dir.glob
      # Be sure not to include "." files or directories
      # Only return filenames, not absolute or relative paths
    end
    
  end
end
