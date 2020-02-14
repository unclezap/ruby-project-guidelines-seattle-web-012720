class WinLoseDraw
    def self.run(game)
        if game[:tricks_taken] > game[:tricks_lost]
            game[:game_result] = "win"
        elsif game[:tricks_taken] < game[:tricks_lost]
            game[:game_result] = "loss"
        else
            game[game_result] = "draw"
        end
        if game[:game_result] == "win"
            Victory.run
        elsif game[:game_result] == "lose"
            Defeat.run
        elsif game[:game_result] == "draw"
            Stalemate.run
        end
    end
end