class DrawACard
    def self.run(game)
        cards = game.shuffles
        cards_in_deck = cards.find_all do |card|
            card[:in_deck] == true
        end
        if cards_in_deck == nil
            binding.pry
            WinLoseDraw.run(game)
        end
        cards_in_deck.first[:on_board] = true
        cards_in_deck.first[:in_deck] = false
        cards_on_board = cards.find_all do |card|
            card[:on_board] == true
        end
        winning_sets = CalculatePossibleSet.run(cards_on_board)
        return_array = {board: cards_on_board, takes: winning_sets}
        return_array
    end
end