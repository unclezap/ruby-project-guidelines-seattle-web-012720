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

            Player.create(name: player_name, tagline: player_tagline)
            PlayGame.run
        elsif play_menu_choice[0] == "2" || play_menu_choice == "two"
            binding.pry
            PlayGame.run
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
end