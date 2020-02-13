class ChangeTagline
    def self.run
        puts `clear`
        puts "CHANGE YO TAGLINE"
        sleep(2)
        i_am_correct = "no"
        while i_am_correct[0] != "y" do
            puts `clear`
            puts ""
            num_players = Player.all.length
            i = 0
            num_players.times do
                w = i + 1
                puts "#{w}. #{Player.all[i][:name]} #{Player.all[i][:tagline]}"
                i += 1            
            end
            puts "Which player are you? Pick a number."
            i_am = gets.chomp
            puts `clear`
            old_player_index = i_am.to_i - 1
            if old_player_index < Player.all.length
                current_player = Player.all[old_player_index]
                puts "#{current_player[:name]}\:"
                puts ""
                puts current_player[:tagline]
                puts ""
                puts "Is this the tagline you want to change?"
                i_am_correct = gets.chomp
                if i_am_correct[0] != "y"
                    puts "Do you want to go back to the main menu?"
                    go_back = gets.strip.downcase
                    if go_back[0] == "y"
                        StartMenu.run
                    end
                    puts "Okay.  Let's try again."
                    sleep(2)
                end
            else
                puts "Something's wrong.  Let's try again"
                sleep(2)
            end
        end
        puts "Okay, so you want to change your tagline.  What do you want your new tagline to be?"
        new_tagline = gets.chomp
        current_player[:tagline] = new_tagline
        current_player.save
        puts `clear`
        puts "#{current_player[:name]}\: #{new_tagline}."
        puts ""
        puts "I like it."
        sleep(3)
        StartMenu.run
    end
end