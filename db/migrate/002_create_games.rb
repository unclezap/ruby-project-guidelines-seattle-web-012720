class CreateGames < ActiveRecord::Migration[5.2]
    def change
        create_table :games do |t|
            t.belongs_to :player
            t.integer :tricks_taken
            t.integer :tricks_lost
        end
    end
end
