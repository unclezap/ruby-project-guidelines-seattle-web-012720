class ComputerTake
    def self.run(game, winning_sets)
        binding.pry

        i = winning_sets.length
        i = i * rand()
        set_taken = winning_sets[i.round()]
        DisplayBoard.highlight_set(board, set_taken)
        #seven digit key is necessary to give <1% chance of matching keys in the same game over 100 games where one player takes all sets. Basically a birthday problem
        set_key = -9999999 * rand()
        set_key = set_key.round().to_s(16)
        game.shuffles.find { |shuffle| shuffle.card == set_taken[0]}[:taken] = set_key
        game.shuffles.find { |shuffle| shuffle.card == set_taken[1]}[:taken] = set_key
        game.shuffles.find { |shuffle| shuffle.card == set_taken[2]}[:taken] = set_key

        game.shuffles.find { |shuffle| shuffle.card == set_taken[0]}[:on_board] = false
        game.shuffles.find { |shuffle| shuffle.card == set_taken[1]}[:on_board] = false
        game.shuffles.find { |shuffle| shuffle.card == set_taken[2]}[:on_board] = false

        game[:tricks_lost] += 1
        DrawThree.run(game)
    end
end