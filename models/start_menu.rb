class StartMenu
    def self.run
        puts `clear`
        
        puts "BATCHES (lol it's Set)"
        puts "-----------------------"
        puts "1. Play a game"
        puts "2. View high score"
        puts "3. Delete records"
        puts "4. Change your tagline"
        puts "5. Quickrun"
        puts "Press q to quit"

        start_menu_choice = gets.strip.downcase

        if start_menu_choice[0] == "q" || start_menu_choice == "exit"
            begin
                puts `clear`
                abort "Thanks for playing"
            end
        elsif start_menu_choice[0] == "1" || start_menu_choice == "one"
            PlayGame.run
        elsif start_menu_choice[0] == "2" || start_menu_choice == "two"
            ViewStat.run
            StartMenu.run
        elsif start_menu_choice[0] == "3" || start_menu_choice == "three"
            DeleteRecord.run
            StartMenu.run
        elsif start_menu_choice[0] == "4" || start_menu_choice == "four"
            ChangeTagline.run
        elsif start_menu_choice[0] == "5" || start_menu_choice == "five"
            QuickRun.run
            StartMenu.run
        elsif start_menu_choice[0] == "6" || start_menu_choice == "six"
            ClassOfSet.run
        else
            puts `clear`
            puts "Let's try that again"
            sleep(3)
            StartMenu.run            
        end
    end
end