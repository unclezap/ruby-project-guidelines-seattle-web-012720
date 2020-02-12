class CreateLists < ActiveRecord::Migration[5.2]
    def change
        create_table :lists do |t|
            t.text :rand_seed, array: true, default []
        t.belongs_to :game
        end
    end
end
