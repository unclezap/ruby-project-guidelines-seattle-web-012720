class GameTurn
    def self.run(game)
        draw_results = DrawACard.run(game)
        # binding.pry
        board = draw_results[:cards_on_board]
        winning_sets = draw_results[:takes]
        #[    Wait Until Unless function
        x = Time.now
        y = 0.8 * game[:difficulty]
        z = 0.4 * y * rand()
        rand_time = y + z.round()
        begin
            status = Timeout::timeout(rand_time) do
                puts "Choose your cards: "
                cards = gets.chomp
            end
        rescue Timeout::Error
                puts "Here is where your computer takes goes"
                binding.pry
        end 
        # # puts "Got: #{status}"
        # rescue Timeout::Error
        # binding.pry
        
        # end
        # ComputerTake.run(game, set) || PlayerTake.run(game, set)
        
        GameTurn.run
    end
end