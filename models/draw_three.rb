class DrawThree
    def self.run(game)
        cards = game.shuffles
        cards_in_deck = cards.find_all do |card|
            card[:in_deck] == true
        end
        if cards_in_deck.length < 2
            num = cards_in_deck.length
        else
            num = 2
        end
        i = 0
        num.times do
            card_in_deck = cards_in_deck[i]
            card_in_deck[:on_board] = true
            card_in_deck[:in_deck] = false
            card_in_deck.save
            i += 1
        end
    end
end