class DeleteRecord
    def self.run
        puts `clear`
        
        puts "DELETE Records"
        puts "-----------------------"
        puts "1. Delete a game"
        puts "2. Delete a player profile"
        puts "3. Return to main menu"
        puts "Press q to quit"

        delete_menu_choice = gets.strip.downcase

        if delete_menu_choice[0] == "q" || delete_menu_choice == "exit"
            begin
                puts `clear`
                abort "Thanks for playing"
            end
        elsif delete_menu_choice[0] == "3" || delete_menu_choice == "three" || delete_menu_choice == "return"
            StartMenu.run
        elsif delete_menu_choice[0] == "1" || delete_menu_choice == "one"
            puts `clear`
            puts "You can't just go around deleting other peoples' games."
            player_match = "no"
            while player_match[0] != "y"
                # binding.pry
                puts "Whose games are you deleting?"
                dead_man_walking = gets.strip.downcase
                # binding.pry
                is_this_the_right_person = Player.all.find {|player| player[:name].strip.downcase == dead_man_walking}
                if is_this_the_right_person == nil
                    puts "Hmm.  I don't know that player.  Try again."
                else
                    # binding.pry
                    puts "Ah, #{is_this_the_right_person[:name]}."
                    # binding.pry
                    puts "Is this correct?"
                    # binding.pry
                    player_match = gets.strip.downcase
                    if player_match[0] != "y"
                        puts "Would you like to go back to the delete menu?"
                        go_back = gets.strip.downcase
                        if go_back[0] == "y"
                            DeleteRecords.run
                        end
                    end
                end
            end
            puts "If you know that player's tagline you can delete their games."
            puts "If you don't know it, you're not fit to destroy their records."
            puts "Enter it, please."
            tagline_guess = gets.strip.downcase
            player_tagline = is_this_the_right_person[:tagline]
            player_tagline_stripped = player_tagline.strip.downcase
            delete_all_correct = "no"
            if tagline_guess == player_tagline_stripped
                while delete_all_correct[0] != "y" do
                    puts "Yep, \"#{player_tagline}\", that's what #{is_this_the_right_person[:name]} always used to say."
                    games_for_deletion = Game.all.find_all {|game| game.player == is_this_the_right_person}
                    num_games = games_for_deletion.length
                    if num_games == 0
                        puts "Wait...it doesn't appear that #{is_this_the_right_person[:name]} has played any games.  What a n00b!"
                        sleep(3)
                        DeleteRecords.run
                    end
                    i = 0
                    num_games.times do
                        w = i + 1
                        puts "#{w}. Game id \#GS#{games_for_deletion[i][:id]}q2 - #{games_for_deletion[i][:tricks_taken]} tricks taken, #{games_for_deletion[i][:tricks_lost]} tricks lost.  Difficulty: #{games_for_deletion[i][:difficulty]}"
                        i += 1
                    end
                    puts "Enter a number to delete that game."
                    delete_choice = gets.chomp
                    delete_choice_index = delete_choice.to_i - 1
                    # binding.pry
                    if delete_choice_index < games_for_deletion.length && delete_choice_index > -1
                        game_on_the_chopping_block = games_for_deletion[delete_choice_index]
                        puts "Choice #{delete_choice}.  Is this correct?"
                        delete_all_correct = gets.chomp
                        if delete_all_correct[0] != "y"
                            puts "Something's wrong.  Let's try again"
                            sleep(2)
                        end
                    else
                        puts "Something's wrong.  Let's try again"
                        sleep(2)
                    end

                end
                puts "Working on deleting that game record right now"
                # binding.pry
                games_for_deletion[delete_choice_index].delete
                # binding.pry
                puts "Successfully deleted!"
                # binding.pry
                sleep(2)
                DeleteRecords.run
            else
                puts "Good try, buddy."
                sleep(2)
                DeleteRecords.run
            end
            # PlayGame.run
        elsif delete_menu_choice[0] == "2" || delete_menu_choice == "two"
            puts `clear`
            puts "You can't just go around deleting other peoples' profiles."
            player_match = "no"
            while player_match[0] != "y"
                puts "Whose player profile are you deleting?"
                dead_man_walking = gets.strip.downcase
                # binding.pry
                is_this_the_right_person = Player.all.find {|player| player[:name].strip.downcase == dead_man_walking}
                if is_this_the_right_person == nil
                    puts "Hmm.  I don't know that player.  Try again."
                else
                    puts "Ah, #{is_this_the_right_person[:name]}."
                    puts "Is this correct?"
                    player_match = gets.strip.downcase
                    if player_match[0] != "y"
                        puts "Would you like to go back to the delete menu?"
                        go_back = gets.strip.downcase
                        if go_back[0] == "y"
                            DeleteRecords.run
                        end
                    end
                end
            end
            puts "If you know that player's tagline you can delete them."
            puts "If you don't know it, I don't know you're them."
            puts "Enter it, please."
            tagline_guess = gets.strip.downcase
            player_tagline = is_this_the_right_person[:tagline]
            player_tagline_stripped = player_tagline.strip.downcase
            yes_sure = "no"
            while yes_sure[0] != "y"
                if tagline_guess == player_tagline_stripped
                    binding.pry
                    puts "Yep, that's you alright.  \"#{player_tagline}\", that's what #{is_this_the_right_person[:name]} always used to say."
                    puts ""
                    puts "...are you sure about this?  No one built out any functionality to restore deleted records."
                    yes_sure = gets.strip.downcase                

                    if yes_sure[0] != "y"
                        # game_on_the_chopping_block = games_for_deletion[delete_choice_index]
                        # puts "Choice #{delete_choice}.  Is this correct?"
                        # delete_all_correct = gets.chomp
                        # if delete_all_correct[0] != "y"
                        puts "Okay.  Caution is always prudent."
                        sleep(2)
                        StartMenu.run
                    end
                else
                    "Good try, buddy."
                    yes_sure = "yes"
                    sleep(2)
                    DeleteRecords.run
                end
            end
            puts "Working on deleting all your records right now"
            binding.pry
            is_this_the_right_person.destroy
            puts "Successfully deleted!"
            binding.pry
            sleep(2)
            DeleteRecords.run
        else
            puts `clear`
            puts "Let's try that again"
            sleep(3)
            DeleteMenu.run            
        end
        # binding.pry
    end
end