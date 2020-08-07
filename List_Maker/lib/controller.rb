#!/usr/bin/env ruby
require_relative 'list_file'

module ListMaker
  class Controller

    @@valid_actions = ['view', 'add', 'edit', 'quit']
    
    def initialize
      @list_file = ListMaker::ListFile.new
    end

    def launch!
      introduction
      # input/action loop
      loop do
        action, args = get_action
        break if action == 'quit'
        result = do_action(action,args)
      end
      conclusion
    end
    
    private
    
      def introduction
        puts "-" * 60
        puts "List Maker".upcase.center(60)
        puts "-" * 60
        puts "This is an interactive program to help create and manage lists."
      end

      def conclusion
        puts
        puts "-" * 60
        puts "Goodbye!".upcase.center(60)
        puts "-" * 60
        puts
      end
    
      def get_action
        action = nil
        until @@valid_actions.include?(action)
          puts "\nAction: " + @@valid_actions.join(', ')
          print "> "
          response = gets.chomp
          args = response.downcase.strip.split(' ')
          action = args.shift
        end
        [action, args]
      end
        
      def do_action(action, args)
        case action
        when 'view'
          @list_file.view
        when 'add'
          @list_file.add
        when 'edit'
          @list_file.edit(args)
        else
          puts "\nI don't understand that command.\n\n"
        end
      end
      
  end
  
end