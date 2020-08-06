require 'date'

puts "-" * 22
puts "| Birthdate Analysis |"
puts "-" * 22

users_birthday_info = {}

puts "What year were you born?"
year_input = gets.chomp.to_i
users_birthday_info[:year] = year_input

puts "What number month were you born?"
month_input = gets.chomp.to_i
users_birthday_info[:month] = month_input

puts "What day number of the month were you born?"
day_input = gets.chomp.to_i
users_birthday_info[:day] = day_input

users_birth_day = Date.new(users_birthday_info[:year], users_birthday_info[:month], users_birthday_info[:day])

puts "-" * 22

puts "You were born on a #{Date::DAYNAMES[users_birth_day.cwday]}"
puts "It was the #{users_birth_day.cweek} week of the year"
puts "It was the #{users_birth_day.yday} day of the year"
puts "#{users_birth_day.leap? ? "You were born on a leap year" : "You were not born on a leap year"}" # leap year

puts "-" * 22