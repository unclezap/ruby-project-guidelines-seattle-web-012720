class List < ActiveRecord::Base
    belongs_to :game
    has_many :shuffles

    def self.create_with_relationships(game)
        num_list = [
            0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
        ]


        new_list = List.new
        new_list[:rand_seed] = num_list.shuffle.join(',')
        new_list.game = game
        new_list.save
    end
end