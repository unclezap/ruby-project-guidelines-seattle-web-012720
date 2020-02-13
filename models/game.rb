class Game < ActiveRecord::Base
    belongs_to :player
    has_one :list
    has_many :shuffles
    has_many :cards, through: :shuffles

    def self.high_score
        highest = -1
        i = 0
        highest_index = 0
        self.all.each do |game_record|
            if game_record[:tricks_taken] > highest
                highest = game_record[:tricks_taken]
                highest_index = i
            end
            i += 1
        end
        20.times {puts ""}
        puts "The high score is #{highest}, which was achieved by #{self.all[highest_index].player[:name]}"
        @highest = highest
        self.score_message
    end
    
    def self.score_message
        if @highest == 27
            puts ""
            puts "THAT WAS A PERFECT GAME HOLY CRAP"
        elsif @highest > 23
            puts ""
            puts "Wow, you almost can't get better than that without some luck"
        elsif @highest > 18
            puts ""
            puts "Hot damn"
        elsif @highest > 12
            puts ""
            puts "pretty nice"
        elsif @highest > 6
            puts ""
            puts ":|"
        else
            puts ""
            puts ":'("
        end
        2.times {puts ""}
        puts "Press enter to continue"
        gets
    end

    def self.create_with_relationships(player, difficulty)
        new_game = Game.new
        new_game[:tricks_taken] = 0
        new_game[:tricks_lost] = 0
        new_game[:difficulty] = difficulty
        player.games << new_game
        new_game.save
        List.create_with_relationships(new_game)
        new_list = List.all.last
        # binding.pry
        new_game.list = new_list
        i = 0
        # binding.pry
        81.times do
            # binding.pry
            if i < 11
                in_play = true
                in_deck = false
            else
                in_play = false
                in_deck = true
            end
            # binding.pry
            new_list = List.all.last
            # binding.pry
            card_index_string = new_list[:rand_seed]
            card_index_array = card_index_string.split(',').map {|s| s.to_i}
            card_index = card_index_array[i]
            # binding.pry
            card = Card.all[card_index]
            Shuffle.create_with_relationships(in_play, in_deck, new_game, new_list, card)
            new_game.shuffles << Shuffle.all.last
            card.shuffles << Shuffle.all.last
            new_list.shuffles << Shuffle.all.last
            i += 1
        end        

    # binding.pry
    end

end