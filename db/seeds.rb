require_relative '../config/environment.rb'

#create a list of values for the card quality attributes to point to
values = [1,2,3]

# create a false deck to rewrite values into
deck = []
81.times {deck << {}}

#rewrite the deck with the needed card
#creates an array of hashes so each card can be created from a hash
deck_index = 0
color_index = 0
3.times do
    shape_index = 0
    3.times do
        num_index = 0
        3.times do
            shade_index = 0
            3.times do
                hash = {}
                hash[:color] = values[color_index]
                hash[:shape] = values[shape_index]
                hash[:number] = values[num_index]
                hash[:shading] = values[shade_index]
                deck[deck_index] = hash
                deck_index += 1
                shade_index += 1
            end
            num_index += 1
        end
        shape_index += 1
    end
    color_index += 1
end

#Add the cards to the database when migration calls on the database
deck.each {|draw| Card.create(draw)}

#makes some test players
test_player_1 = Player.create({name: "Zap", tagline: "Yo"})
test_player_2 = Player.create({name: "Meghraj", tagline: "Hi hero"})
test_player_3 = Player.create({name: "Yamcha", tagline: "AAAAAAAAAAAAHHHH"})

#make test games
test_game_1 = Game.create({tricks_taken: 20, tricks_lost: 5}) 
test_game_2 = Game.create({tricks_taken: 0, tricks_lost: 12})
test_game_3 = Game.create({tricks_taken: 10, tricks_lost: 14})
test_game_4 = Game.create({tricks_taken: 13, tricks_lost: 13})

#assign test games to test players
test_player_1.games << test_game_1
test_player_2.games << test_game_2
test_player_3.games << test_game_3
test_player_3.games << test_game_4

#card index for making random seeds
num_list = [
    0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
]

#our random shuffle indices
first_seed = num_list.shuffle.join(',')
first_seed_array = first_seed.split(',').map {|s| s.to_i}
second_seed = num_list.shuffle.join(',')
second_seed_array = second_seed.split(',').map {|s| s.to_i}
third_seed = num_list.shuffle.join(',')
third_seed_array = third_seed.split(',').map {|s| s.to_i}
fourth_seed = num_list.shuffle.join(',')
fourth_seed_array = fourth_seed.split(',').map {|s| s.to_i}

#makes test lists
test_list_1 = List.create({rand_seed: first_seed})
test_list_2 = List.create({rand_seed: second_seed})
test_list_3 = List.create({rand_seed: third_seed})
test_list_4 = List.create({rand_seed: fourth_seed})

#assigns test lists to test games
test_game_1.list = test_list_1
test_game_2.list = test_list_2
test_game_3.list = test_list_3
test_game_4.list = test_list_4

#make some keys to identify taken sets for test shuffles and set start values for some useful variables
in_play = true
drawn = true
player_set_keys_array = []
computer_set_keys_array = []
50.times do
    player_set_keys_array << (rand()*9999999).round.to_s(16)
    end
50.times do
    computer_set_keys_array << (rand()*-9999999).round.to_s(16)
    end
taken_keys = []
player_keys_index = 0
computer_keys_index = 0

##shuffle for first game
#first make the set keys for first test shuffle
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

#then set card states for first shuffle
i = 0
81.times do
    if i < 74
        in_play = false
    else
        in_play = true
    end
    shuffle_cut = Shuffle.create({
        on_board: in_play,
        in_deck: false,
        taken: taken_keys.pop
    })
    test_game_1.shuffles << shuffle_cut
    Card.all[i].shuffles << shuffle_cut
    i += 1
end 


##shuffle for second game.  This game is still in progress
#first keys for 2nd
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

#then card states for 2nd
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
    shuffle_cut = Shuffle.create({
        on_board: in_play,
        in_deck: drawn,
        taken: taken_keys.pop,
    })
    test_game_2.shuffles << shuffle_cut
    Card.all[i].shuffles << shuffle_cut
    i += 1
end 

##shuffle for third game
#first keys for 3rd
3.times do
    3.times do
        taken_keys << nil
    end
end
14.times do
    3.times do
        taken_keys << computer_set_keys_array[computer_keys_index]
    end
    computer_keys_index += 1
end
10.times do
    3.times do
        taken_keys << player_set_keys_array[player_keys_index]
    end
    player_keys_index += 1
end

#then card states for 3rd
i = 0
81.times do
    if i < 71
        in_play = false
    else
        in_play = true
    end
    shuffle_cut = Shuffle.create({
        on_board: in_play,
        in_deck: false,
        taken: taken_keys.pop,
    })
    test_game_3.shuffles << shuffle_cut
    Card.all[i].shuffles << shuffle_cut
    i += 1
end

#shuffle for fourth game
3.times do
    taken_keys << nil
end
13.times do
    3.times do
        taken_keys << computer_set_keys_array[computer_keys_index]
    end
    computer_keys_index += 1
end
13.times do
    3.times do
        taken_keys << player_set_keys_array[player_keys_index]
    end
    player_keys_index += 1
end

#then set card states for fourth
i = 0
81.times do
    if i < 78
        in_play = false
    else
        in_play = true
    end
    shuffle_cut = Shuffle.create({
        on_board: in_play,
        in_deck: false,
        taken: taken_keys.pop
    })
    test_game_4.shuffles << shuffle_cut
    Card.all[i].shuffles << shuffle_cut
    i += 1
end 
