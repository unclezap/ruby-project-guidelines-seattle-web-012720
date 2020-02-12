class CreateCards < ActiveRecord::Migration[5.2]
    def change
        create_table :cards do |t|
            t.integer :color
            t.integer :shape
            t.integer :number
            t.integer :shading
        end
    end
end
