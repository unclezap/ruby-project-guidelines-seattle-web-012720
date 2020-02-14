class WinLoseDraw
    def self.run(game)
        if game[:game_result] == "win"
            Victory.run
        elsif game[:game_result] == "lose"
            Defeat.run
        elsif game[:game_result] == "draw"
            Stalemate.run
        end
    end
end