class ComputerTake
    def self.run(game, board, winning_sets)

        i = winning_sets.length
        i = i * rand()
        set_taken = winning_sets[i.round()]

        DisplayBoard.highlight_set(board, set_taken)
        
        #seven digit key is necessary to give <1% chance of matching keys in the same game over 100 games where one player takes all sets. Basically a birthday problem
        set_key = -9999999 * rand()
        set_key = set_key.round().to_s(16)
        
        set_shuffle_one = game.shuffles.find { |shuffle| shuffle.card == set_taken[0]}
        set_shuffle_two = game.shuffles.find { |shuffle| shuffle.card == set_taken[1]}
        set_shuffle_three = game.shuffles.find { |shuffle| shuffle.card == set_taken[2]}

        set_shuffle_one[:taken] = set_key
        set_shuffle_two[:taken] = set_key
        set_shuffle_three[:taken] = set_key

        set_shuffle_one[:on_board] = false
        set_shuffle_two[:on_board] = false
        set_shuffle_three[:on_board] = false

        set_shuffle_one.save
        set_shuffle_two.save
        set_shuffle_three.save

        game[:tricks_lost] += 1
        game.save
        DrawThree.run(game)
    end
end