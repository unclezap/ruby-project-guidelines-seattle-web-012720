class PlayGame
    def self.run
        puts `clear`
        puts ""
        puts "1. New player"
        puts "2. Old player"
        puts "3. Return to start menu"
        puts "Press q to quit" 
     
        play_menu_choice = gets.strip.downcase

        if play_menu_choice[0] == "1" || play_menu_choice == "one"
            correct = "no"    
            while correct[0] != "y" do
                puts `clear`
                puts ""
                puts "Type your name:"
                player_name = gets.chomp
                puts "Is this correct: #{player_name}?"
                correct = gets.strip.downcase
                
                tag_correct = "no"
                while tag_correct[0] != "y" do
                    puts `clear`
                    puts ""
                    puts "#{player_name}, you need a tagline."
                    puts "Something like, \"Set on beating you, #{player_name}-style"
                    puts "You can make your tagline whatever you like, but you have to make one."
                    puts "What's your tagline?"
                    player_tagline = gets.chomp
                    puts "#{player_tagline}"
                    puts "Is this correct?"
                    tag_correct = gets.strip.downcase
                end
            end

            current_player = Player.create(name: player_name, tagline: player_tagline)
            @current_player = current_player
            PlayGame.start_game
        elsif play_menu_choice[0] == "2" || play_menu_choice == "two"
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
                    puts current_player[:name]
                    puts "Is this correct?"
                    i_am_correct = gets.chomp
                    if i_am_correct[0] != "y"
                        puts "Something's wrong. Let's try again"
                        sleep(2)
                    end
                else
                    puts "Something's wrong.  Let's try again"
                    sleep(2)
                end
            end
            @current_player = current_player
            PlayGame.start_game
        elsif play_menu_choice[0] == "3" || play_menu_choice == "three" || play_menu_choice == "return"
            StartMenu.run
        elsif play_menu_choice[0] == "q" || play_menu_choice == "exit"
            begin
                puts `clear`
                puts "Thanks for playing"
                puts "Ciao"
                exit!
            rescue SystemExit
            end
        else
            puts `clear`
            puts "Let's try that again"
            sleep(3)
            PlayGame.run
        end     

        sleep(2)
        StartMenu.run
    end

    def self.start_game
        if @current_player.games.length > 0
            unfinished_games = @current_player.games.find_all {|game| game[:game_result] == nil}
            num_unfinished_games = unfinished_games.length
            if num_unfinished_games > 0
                puts `clear`
                puts ""
                puts "Do you want to play an old game?"
                old_game = gets.strip.downcase
                if old_game[0] == "y"
                
                    i = 0
                    num_unfinished_games.times do
                        w = i + 1
                        puts "#{w}. Game id \#GS#{unfinished_games[i][:id]}q2 - #{unfinished_games[i][:tricks_taken]} tricks taken, #{unfinished_games[i][:tricks_lost]} tricks lost.  Difficulty: #{unfinished_games[i][:difficulty]}"
                        i += 1
                    end
                    puts "Enter a number to select that game."
                    old_game_choice = gets.chomp
                    old_game_choice_index = old_game_choice.to_i - 1
                    if old_game_choice_index < num_unfinished_games && old_game_choice_index > -1
                        game = unfinished_games[old_game_choice_index]
                        puts "Choice #{old_game_choice}.  Is this correct?"
                        old_game_choice_correct = gets.chomp
                        if old_game_choice_correct[0] != "y"
                            puts "Something's wrong.  Let's try again"
                            PlayGame.start_game
                        else
                            GameTurn.run(game)
                        end
                    else
                        puts "Something's wrong.  Let's try again"
                        sleep(2)
                        PlayGame.start_game
                    end

                elsif old_game[0] == "n"
                    puts "Cool."
                    sleep(2)
                else
                    puts "I'm not sure what you mean."
                    sleep(2)
                    PlayGame.start_game
                end
            end
        end

        puts `clear`
        puts ""
        puts "What difficulty do you want?"
        puts "1. Easy"
        puts "2. Medium"
        puts "3. Hard"
        puts "4. Custom"
        get_difficulty = gets.strip.downcase
        get_int_difficulty = get_difficulty.to_i

        if get_int_difficulty == 1 || get_difficulty == "one"
            difficulty = 60
        elsif get_int_difficulty == 2 || get_difficulty == "two"
            difficulty = 30
        elsif get_int_difficulty == 3 || get_difficulty == "three"
            difficulty = 10
        elsif get_int_difficulty == 4 || get_difficulty == "four"
            puts "How many seconds on average do you want to identify a set?"
            difficulty_string = gets.chomp
            difficulty = difficulty_string.to_i
            if difficulty < 2 || difficulty > 300
                puts "That seems crazy.  I'm going to give you 30."
                sleep(3)
                difficulty = 30
            end
        else
            puts "Huh?"
            sleep(2)
            PlayGame.start_game
        end
        puts `clear`
        puts "Good luck!"
        sleep(1)
        # binding.pry
        Game.create_with_relationships(@current_player, difficulty)
        game = Game.all.last
        GameTurn.run(game)
    end
end