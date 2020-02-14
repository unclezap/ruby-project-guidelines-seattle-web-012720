class CalculatePossibleSet
    def self.run(board_array)
        cards = board_array.map {|shuffle| shuffle.card}
        # binding.pry    
        set_matches = []    
        cards.each do |card|
            array = []
            array << card
            math_array_one = []
            math_array_one << card[:color]
            math_array_one << card[:shape]
            math_array_one << card[:number]
            math_array_one << card[:shading]
            sets = []
            cards.each do |card_two|
                if card != card_two
                    array << card_two
                    math_array_two = []
                    math_array_two << card_two[:color]
                    math_array_two << card_two[:shape]
                    math_array_two << card_two[:number]
                    math_array_two << card_two[:shading]
                    cards.each do |card_three|
                        if card != card_three && card_two != card_three
                            array << card_three
                            math_array_three = []
                            math_array_three << card_three[:color]
                            math_array_three << card_three[:shape]
                            math_array_three << card_three[:number]
                            math_array_three << card_three[:shading]
                            quality_success = []
                            set_success = []
                            i = 0
                            4.times do
                                # binding.pry
                                sum = math_array_one[i] + math_array_two[i] + math_array_three[i]
                                if math_array_one[i] == math_array_two[i] && math_array_one[i] == math_array_three[i]
                                    quality_success << card
                                    quality_success << card_two
                                    quality_success << card_three
                                    set_matches << quality_success
                                elsif sum == 6
                                    quality_success << card
                                    quality_success << card_two
                                    quality_success << card_three
                                    set_matches << quality_success
                                else
                                
                                end
                                i += 1
                            end
                            if set_matches.length == 4
                                sets << set_matches[0]
                            end
                        end
                        array.pop
                    end
                end
                array.pop
            end
            array.pop
        end    

        binding.pry
        sets
    end
end