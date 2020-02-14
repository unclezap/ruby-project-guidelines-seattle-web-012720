class DisplayBoard
    def self.run(board_array)
        puts `clear`
        num_assignments = board_array.length
        card_images = []
        i = 0
        image = ""
        num_assignments.times do
            if board_array[i].card[:color] == 1
                if board_array[i].card[:number] == 1
                    image += "1 ".yellow
                elsif board_array[i].card[:number] == 2
                    image += "2 ".yellow
                else
                    image += "3 ".yellow
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".yellow
                elsif board_array[0].card[:shading] == 2
                    image += "B ".yellow
                else 
                    image += "C ".yellow
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".yellow
                elsif board_array[i].card[:shape] == 2
                    image += "# ".yellow
                else
                    image += "$ ".yellow
                end

            elsif board_array[i].card[:color] == 2
                if board_array[i].card[:number] == 1
                    image += "1 ".red
                elsif board_array[i].card[:number] == 2
                    image += "2 ".red
                else
                    image += "3 ".red
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".red
                elsif board_array[i].card[:shading] == 2
                    image += "B ".red
                else 
                    image += "C ".red
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".red
                elsif board_array[i].card[:shape] == 2
                    image += "# ".red
                else
                    image += "$ ".red
                end

            else
                if board_array[i].card[:number] == 1
                    image += "1 ".blue
                elsif board_array[i].card[:number] == 2
                    image += "2 ".blue
                else
                    image += "3 ".blue
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".blue
                elsif board_array[i].card[:shading] == 2
                    image += "B ".blue
                else 
                    image += "C ".blue
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".blue
                elsif board_array[i].card[:shape] == 2
                    image += "# ".blue
                else
                    image += "$ ".blue
                end
            end
            image += "       "
            if i == 3 || i == 7 || i == 11 || i == 15
                image += "\n"
                image += "\n"
            end
            i += 1
        end
        puts image
    end
    
    def self.highlight_set(board_array,set)
        puts `clear`
        num_assignments = board_array.length
        card_images = []
        i = 0
        image = ""
        num_assignments.times do
            if board_array[i].card[:color] == 1 && board_array[i].card != set[0] && board_array[i].card != set[1] && board_array[i].card != set[2]
                if board_array[i].card[:number] == 1
                    image += "1 ".yellow
                elsif board_array[i].card[:number] == 2
                    image += "2 ".yellow
                else
                    image += "3 ".yellow
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".yellow
                elsif board_array[0].card[:shading] == 2
                    image += "B ".yellow
                else 
                    image += "C ".yellow
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".yellow
                elsif board_array[i].card[:shape] == 2
                    image += "# ".yellow
                else
                    image += "$ ".yellow
                end

            elsif board_array[i].card[:color] == 2 && board_array[i].card != set[0] && board_array[i].card != set[1] && board_array[i].card != set[2]
                if board_array[i].card[:number] == 1
                    image += "1 ".red
                elsif board_array[i].card[:number] == 2
                    image += "2 ".red
                else
                    image += "3 ".red
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".red
                elsif board_array[i].card[:shading] == 2
                    image += "B ".red
                else 
                    image += "C ".red
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".red
                elsif board_array[i].card[:shape] == 2
                    image += "# ".red
                else
                    image += "$ ".red
                end

            elsif board_array[i].card[:color] == 3 && board_array[i].card != set[0] && board_array[i].card != set[1] && board_array[i].card != set[2]
                if board_array[i].card[:number] == 1
                    image += "1 ".blue
                elsif board_array[i].card[:number] == 2
                    image += "2 ".blue
                else
                    image += "3 ".blue
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".blue
                elsif board_array[i].card[:shading] == 2
                    image += "B ".blue
                else 
                    image += "C ".blue
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".blue
                elsif board_array[i].card[:shape] == 2
                    image += "# ".blue
                else
                    image += "$ ".blue
                end
            else
                if board_array[i].card[:number] == 1
                    image += "1 ".white
                elsif board_array[i].card[:number] == 2
                    image += "2 ".white
                else
                    image += "3 ".white
                end
                if board_array[i].card[:shading] == 1
                    image += "A ".white
                elsif board_array[i].card[:shading] == 2
                    image += "B ".white
                else 
                    image += "C ".white
                end
                if board_array[i].card[:shape] == 1
                    image += "@ ".white
                elsif board_array[i].card[:shape] == 2
                    image += "# ".white
                else
                    image += "$ ".white
                end
            end

            image += "       "
            if i == 3 || i == 7 || i == 11 || i == 15
                image += "\n"
                image += "\n"
            end
            i += 1
        end
        puts image
        sleep(2)
    end
end