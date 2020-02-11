require 'pry'
values = [1,2,3]
deck = []
81.times {deck << [5,5,5,5,5]}
index = 0
color = 0.0
number = 0.0
shade = 0.0
shape = 0.0
81.times do
    color_index = index/27
    number_index = index/9
    # binding.pry
    deck[index][0] = values[color_index]
    deck[index][1] = values[number_index/3]
    index += 1
end
binding.pry


### THIS DOESN'T WORK ###