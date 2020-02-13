class StartMenu
    def self.run
        puts `clear`
        
        puts "BATCHES (lol it's Set)"
        puts "-----------------------"
        puts "1. Play a game NOT BUILT"
        puts "2. View stats NOT BUILT"
        puts "3. Delete records NOT BUILT"
        puts "4. Play in the class of sets NOT BUILT"
        puts "5. Debug mode NOT BUILT"
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
            ViewStats.run
        elsif start_menu_choice[0] == "3" || start_menu_choice == "three"
            DeleteRecords.run
        elsif start_menu_choice[0] == "4" || start_menu_choice == "four"
            ClassOfSets.run
        elsif start_menu_choice[0] == "5" || start_menu_choice == "five"
            puts "Debug mode NOT BUILT"
            sleep(3)
            StartMenu.run
        else
            puts `clear`
            puts "Let's try that again"
            sleep(3)
            StartMenu.run            
        end
    end
end