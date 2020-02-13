class Shuffle < ActiveRecord::Base
    belongs_to :game
    belongs_to :card
    belongs_to :list

    def self.create_with_relationships(in_play, in_deck, game, list, card)
        new_shuffle = Shuffle.new
        new_shuffle[:on_board] = in_play
        new_shuffle[:in_deck] = in_deck
        new_shuffle[:taken] = nil
        game.shuffles << new_shuffle
        card.shuffles << new_shuffle
        list.shuffles << new_shuffle
        new_shuffle.save
    end
end