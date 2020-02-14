class DrawACard
    def self.run(game)
        cards = game.shuffles
        cards_in_deck = cards.find_all do |card|
            card[:in_deck] == true
        end
        if cards_in_deck.length == 0
            WinLoseDraw.run(game)
        end
        drawn_card = cards_in_deck[0]
        drawn_card[:on_board] = true
        drawn_card[:in_deck] = false
        drawn_card.save

        cards_on_board = cards.find_all do |card|
            card[:on_board] == true
        end
        winning_sets = CalculatePossibleSet.run(cards_on_board)
        return_array = {board: cards_on_board, takes: winning_sets}
        return_array
    end
end