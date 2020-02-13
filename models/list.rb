class List < ActiveRecord::Base
    belongs_to :game
    has_many :shuffles

    def self.create_with_relationships(game)
        num_list = [
            0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
        ]

        brand_new_list = List.new
        # binding.pry
        new_list_string = num_list.shuffle.join(',')
        # binding.pry
        brand_new_list[:rand_seed] = new_list_string
        # new_list.game = game
        # binding.pry

        brand_new_list.save
        # binding.pry

    end
end