puts "Yoooooo"
puts "Press any key and enter to begin"
gets.chomp
x = Time.now

require 'timeout'
y = 10
begin
  status = Timeout::timeout(y) {
    puts x
    printf "Input: "
    gets
  }
  puts "Got: #{status}"
rescue Timeout::Error
  puts "Input timed out after #{y} seconds"
  puts "Time.now is #{Time.now}"
end

# loop do
#     sleep(1)
#     a = gets.chomp
#     if a == "wall" || sleep(10)
#         puts "WOOOOO!!!!"
#         break
#     end
# end
