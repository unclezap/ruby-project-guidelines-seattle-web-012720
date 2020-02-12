class CreateLists < ActiveRecord::Migration[5.2]
    def change
        create_table :lists do |t|
            #sqlite3 does not support arrays
            t.string :rand_seed
            t.belongs_to :game
        end
    end
end
