class CreateGames < ActiveRecord::Migration[5.2]
    def change
        create_table :games do |t|
            t.belongs_to :player
            t.integer :tricks_taken
            t.integer :tricks_lost
            t.string :game_result
            t.integer :difficulty
        end
    end
end
