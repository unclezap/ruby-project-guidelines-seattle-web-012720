require 'pry'

# num_list = [
#     0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
# ]

# rand_list = num_list.shuffle
# rand_string = rand_list.join(',')
# pulled_list = rand_string.split(',').map {|s| s.to_i}

# first_seed = num_list.shuffle.join(',')
# second_seed = num_list.shuffle.join(',')
# third_seed = num_list.shuffle.join(',')
# fourth_seed = num_list.shuffle.join(',')

num_list = [
    0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
]

first_seed = num_list.shuffle.join(',')
first_seed_array = first_seed.split(',').map {|s| s.to_i}
second_seed = num_list.shuffle.join(',')
second_seed_array = second_seed.split(',').map {|s| s.to_i}
third_seed = num_list.shuffle.join(',')
third_seed_array = third_seed.split(',').map {|s| s.to_i}
fourth_seed = num_list.shuffle.join(',')
fourth_seed_array = fourth_seed.split(',').map {|s| s.to_i}
player_set_keys_array = []
computer_set_keys_array = []

i = 0
in_play = true
drawn = true
set_keys_array = []
50.times do
    player_set_keys_array << (rand()*9999999).round.to_s(16)
    end
50.times do
    computer_set_keys_array << (rand()*-9999999).round.to_s(16)
    end
taken_keys = []
player_keys_index = 0
computer_keys_index = 0

shuffle = []

#shuffle for first game
2.times do
    3.times do
        taken_keys << nil
    end
end
5.times do
    3.times do
        taken_keys << computer_set_keys_array[computer_keys_index]
    end
    computer_keys_index += 1
end
20.times do
    3.times do
        taken_keys << player_set_keys_array[player_keys_index]
    end
    player_keys_index += 1
end

# binding.pry

81.times do
    if i < 74
        in_play = false
    else
        in_play = true
    end
    shuffle << {
        game_id: 1,
        card_id: first_seed_array[i],
        on_board: in_play,
        in_deck: false,
        taken: taken_keys.pop
    }
    i += 1
end 

# binding.pry


#second shuffle
second_shuffle = []

15.times do
    3.times do
        taken_keys << nil
    end
end
12.times do
    3.times do
        taken_keys << computer_set_keys_array[computer_keys_index]
    end
    computer_keys_index += 1
end

# binding.pry
i = 0
81.times do
    if i < 36
        in_play = false
        drawn = false
    elsif i < 48
        in_play =  true
        drawn = false
    else
        in_play = false
        drawn = true
    end
    second_shuffle << {
        game_id: 1,
        card_id: second_seed_array[i],
        on_board: in_play,
        in_deck: drawn,
        taken: taken_keys.pop,
        id: i
    }
    i += 1
end 


binding.pry