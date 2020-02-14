class GameTurn
    def self.run(game)
        draw_results = DrawACard.run(game)
        board = draw_results[:board]
        winning_sets = draw_results[:takes]
        
        DisplayBoard.run(board)
        
        #Wait Until Unless function
        x = Time.now
        y = 0.8 * game[:difficulty]
        z = 0.4 * y * rand()
        rand_time = y + z.round()
        
        begin
            status = Timeout::timeout(rand_time) do
                DisplayBoard.run(board)
                puts "Choose your cards: "
                guess = gets.chomp
                if guess
                    converted_guess = GuessConverter.run(board, guess)
                    PlayerTake.run(game, board, winning_sets, converted_guess)
                end
            end
        rescue Timeout::Error
                ComputerTake.run(game, board,winning_sets)
        end        
        GameTurn.run(game)
    end
end