class DrawThree
    def self.run(game)
        cards = game.shuffles
        cards_in_deck = cards.find_all do |card|
            card[:in_deck] == true
        end
        if cards_in_deck.length < 3
            num = cards_in_deck.length
        else
            num = 3
        end
        i = 0
        num.times do
            cards_in_deck[i][:on_board] = true
            cards_in_deck[i][:in_deck] = false
            i += 1
        end
    end
end