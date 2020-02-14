class CalculatePossibleSet
    def self.run(board_array)
        cards = board_array.map {|shuffle| shuffle.card}
        # binding.pry    
        # set_matches = []
        sets = []
        array = []    
        cards.each do |card|
            array = []
            array << card
            # binding.pry
            math_array_one = []
            math_array_one << card[:color]
            math_array_one << card[:shape]
            math_array_one << card[:number]
            math_array_one << card[:shading]
            
            cards.each do |card_two|
                # binding.pry
                if card != card_two
                    # binding.pry
                    array << card_two
                    # binding.pry
                    math_array_two = []
                    math_array_two << card_two[:color]
                    math_array_two << card_two[:shape]
                    math_array_two << card_two[:number]
                    math_array_two << card_two[:shading]
                    
                    cards.each do |card_three|
                        # binding.pry
                        if card != card_three && card_two != card_three
                            array << card_three
                            math_array_three = []
                            math_array_three << card_three[:color]
                            math_array_three << card_three[:shape]
                            math_array_three << card_three[:number]
                            math_array_three << card_three[:shading]
                            quality_success = []
                            set_matches = []
                            i = 0
                            4.times do
                                # binding.pry
                                sum = math_array_one[i] + math_array_two[i] + math_array_three[i]
                                # binding.pry
                                if math_array_one[i] == math_array_two[i] && math_array_one[i] == math_array_three[i]
                                    quality_success << card
                                    quality_success << card_two
                                    quality_success << card_three
                                    set_matches << quality_success
                                elsif sum == 6
                                    quality_success << card
                                    quality_success << card_two
                                    quality_success << card_three
                                    set_matches << quality_success.uniq
                                else
                                
                                end
                                i += 1
                            end
                            array.pop
                            if set_matches.length == 4
                                sets << set_matches
                            end
                        
                        end
                        
                    end
                    array.pop
                end
            end
            array.pop
        end    
        result_array = []
        single_sets = sets.map do |set|
            mini_result = []
            mini_result << set[0][0]
            mini_result << set[0][1]
            mini_result << set[0][2]
            result_array << mini_result.sort_by {|mini_result| mini_result[:id]}
        end
        final_results = result_array.uniq
        

        if final_results == nil
            binding.pry
        end

        final_results
        # if final_results.length == 0 || final_results == [] or final_results == nil
        #     binding.pry
        # end
    end
end