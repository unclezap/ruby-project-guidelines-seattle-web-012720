require_relative '../config/environment'
require 'timeout'


x = Time.now
gets
input = "no"
while Time.now < x + 15 || input == "no"
    puts "input"
    input = gets
end

binding.pry
StartMenu.run

puts `clear`
puts "Goodbye!"
gets