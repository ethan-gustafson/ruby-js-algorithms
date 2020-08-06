## Challenge: To-Do List

1. Define a ToDoList Class
2. In the ToDoList Class, mix in Ruby's built in module Enumerable (Arrays, Hashes and Ranges do use it)
3. You have to define an `each` method in the ToDoList Class. Use this one:

```ruby
def each
    @items.each{|item| yield(item)}
end
```

4. Create an attribute called items
5. Create a class method called items