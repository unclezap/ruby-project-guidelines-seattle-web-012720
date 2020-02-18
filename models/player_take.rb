class PlayerTake
    def self.run(game, board, winning_sets, guess)
        card_guess = guess.map {|shuffle| shuffle.card}
        ordered_guess = card_guess.sort_by {|card| card[:id]}
        match = winning_sets.find {|set| set == ordered_guess}
        # binding.pry
        if match

            #seven digit key is necessary to give <1% chance of matching keys in the same game over 100 games where one player takes all sets. Basically a birthday problem
            DisplayBoard.highlight_set(game, board,ordered_guess)
            puts "Success!"
            sleep(5)

            set_key = 9999999 * rand()
            set_key = set_key.round().to_s(16)

            set_shuffle_one = game.shuffles.find { |shuffle| shuffle.card == match[0]}
            set_shuffle_two = game.shuffles.find { |shuffle| shuffle.card == match[1]}
            set_shuffle_three = game.shuffles.find { |shuffle| shuffle.card == match[2]}
    
            set_shuffle_one[:taken] = set_key
            set_shuffle_two[:taken] = set_key
            set_shuffle_three[:taken] = set_key
    
            set_shuffle_one[:on_board] = false
            set_shuffle_two[:on_board] = false
            set_shuffle_three[:on_board] = false
    
            set_shuffle_one.save
            set_shuffle_two.save
            set_shuffle_three.save
            # binding.pry
            # if game[:tricks_won] == nil
            #     # binding.pry
            #     game[:tricks_won] = 1
            # else
            #     # binding.pry
            # current_tricks = game[:tricks_won]
            # new_tricks = current_tricks + 1
            # game[:tricks_won] = new_tricks
            # end
            game.save
            # binding.pry

            DrawThree.run(game)
        elsif
            # binding.pry
            # puts "Oh no! That's not a set.  The computer found one though."
            # sleep(0)
            # sleep(5)
            
            ComputerTake.run(game, board, winning_sets)
        end
    end
end