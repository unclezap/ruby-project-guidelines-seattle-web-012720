require_relative '../config/environment.rb'

#create a list of values for the card quality attributes to point to
values = [1,2,3]

# create a false deck to rewrite values into
deck = []
81.times {deck << {}}

#rewrite the deck with the needed card
#creates an array of hashes so each card can be created from a hash
deck_index = 0
color_index = 0
3.times do
    shape_index = 0
    3.times do
        num_index = 0
        3.times do
            shade_index = 0
            3.times do
                hash = {}
                hash[:card_id] = deck_index
                hash[:color] = values[color_index]
                hash[:shape] = values[shape_index]
                hash[:number] = values[num_index]
                hash[:shading] = values[shade_index]
                deck[deck_index] = hash
                deck_index += 1
                shade_index += 1
            end
            num_index += 1
        end
        shape_index += 1
    end
    color_index += 1
end

#Add the cards to the database when migration calls on the database
deck.each {|draw| Card.create(draw)}