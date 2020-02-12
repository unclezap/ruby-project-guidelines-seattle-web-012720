values = [1,2,3]
deck = []
81.times {deck << [5,5,5,5,5]}
deck_index = 0
color_index = 0
3.times do
    shape_index = 0
    3.times do
        num_index = 0
        3.times do
            shade_index = 0
            3.times do
                deck[deck_index] = [values[color_index], values[shape_index], values[num_index], values[shade_index], rand()]
                deck_index += 1
                shade_index += 1
            end
            num_index += 1
        end
        shape_index += 1
    end
    color_index += 1
end
shuffle = deck.sort_by {|card| card[4]}
shuffle

# class Card
#     attr_accessor :card_id, :color, :shape, :number, :shading
#     @@all = []

#     def initialize (card_id:, color:, shape:, number:, shading:)
#         @card_id = card_id
#         @color = color
#         @shape = shape
#         @number = number
#         @shading = shading
#         @@all << self
#     end

#     def self.all
#         @@all
#     end


# end
# binding.pry
