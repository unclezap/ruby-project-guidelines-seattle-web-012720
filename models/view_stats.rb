class ViewStats
    def self.run
        puts `clear`

        puts "STATS"
        puts "-----------------------"
        puts "1. High score"
        puts "2. Low score"
        puts "3. Games played"
        puts "4. Human win%"
        puts "5. Computer win%"
        puts "6. Player stats"
        puts "7. Return to start menu"
        puts "Press q to quit"

        stats_menu_choice = gets.strip.downcase

        if stats_menu_choice[0] == "1" || stats_menu_choice == "one"
            Game.high_score
            gets
            ViewStats.run
        elsif stats_menu_choice[0] == "2" || stats_menu_choice == "two"
            Game.low_score
            gets
            ViewStats.run
        elsif stats_menu_choice[0] == "3" || stats_menu_choice == "three"
            puts `clear`
            puts ""
            puts "Players have played #{Game.all.length} games!"
            gets
            ViewStats.run
        elsif stats_menu_choice[0] == "4" || stats_menu_choice == "four"
            Game.computer_wins
            gets
            ViewStats.run
        elsif stats_menu_choice[0] == "5" || stats_menu_choice == "five"
            Game.human_wins
            gets
            ViewStats.run
        elsif stats_menu_choice[0] == "6" || stats_menu_choice == "six"
            ViewStats.player_stats
            gets
            ViewStats.run
        elsif stats_menu_choice[0] == "7" || stats_menu_choice == "seven" || stats_menu_choice == "return"
            StartMenu.run
        elsif stats_menu_choice[0] == "q" || stats_menu_choice == "exit"
                begin
                    puts `clear`
                    puts "Thanks for playing"
                    puts "Bye"
                    exit!
                rescue SystemExit
                    
                end
        else
            puts `clear`
            puts "Let's try that again"
            sleep(3)
            ViewStats.run            
        end

        sleep(2)
        StartMenu.run
    end
end