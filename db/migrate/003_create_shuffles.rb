class CreateShuffles < ActiveRecord::Migration[5.2]
    def change
        create_table :shuffles do |t|
            t.belongs_to :game
            t.belongs_to :card
            t.boolean :on_board
            t.boolean :in_deck
            t.boolean :taken
        end
    end
end
