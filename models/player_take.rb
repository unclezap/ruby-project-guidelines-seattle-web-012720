class PlayerTake
    def self.run(game, board, winning_sets, guess)
        ordered_guess = guess.sort_by {|card| card[:id]}
        match = winning_sets.find {|set| set == ordered_guess}
        if match
            i = winning_sets.length
            i = i * rand()
            set_taken = winning_sets[i.round()]
            #seven digit key is necessary to give <1% chance of matching keys in the same game over 100 games where one player takes all sets. Basically a birthday problem
            set_key = 9999999 * rand()
            set_key = set_key.round().to_s(16)
            game.shuffles.find { |shuffle| shuffle.card == set_taken[0]}[:taken] = set_key
            game.shuffles.find { |shuffle| shuffle.card == set_taken[1]}[:taken] = set_key
            game.shuffles.find { |shuffle| shuffle.card == set_taken[2]}[:taken] = set_key

            game.shuffles.find { |shuffle| shuffle.card == set_taken[0]}[:on_board] = false
            game.shuffles.find { |shuffle| shuffle.card == set_taken[1]}[:on_board] = false
            game.shuffles.find { |shuffle| shuffle.card == set_taken[2]}[:on_board] = false

            game[:tricks_won] += 1
            DrawThree.run(game)
        elsif
            puts "Oh no! That's not a set.  The computer found one though."
            ComputerTake.run(game, winning_sets)
        end
    end
end