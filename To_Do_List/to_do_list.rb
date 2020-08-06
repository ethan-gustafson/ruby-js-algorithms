#!/usr/bin/env ruby

class ToDoList

    include Enumerable

    attr_reader :items

    def initialize(items=[])
        @items = items
    end

    def each
        @items.each{|item| yield(item)}
    end

    def <<(arg)
        self.unshift(arg)
    end

    def first
        self[0]
    end

end

list = ToDoList.new(["take out trash", "clean room", "pay bills", "finish tutorials"])

list.items<<("Dance") #non-functional, not sure why it doesn't work

i = 0

until i >= list.items.count
    puts list.items[i]
    i += 1
end

# puts list.items.sort
# puts list.items.find{|item| item.length > 4}