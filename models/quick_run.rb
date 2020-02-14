class QuickRun
    def self.run
        # game = Game.all.find {|game| game[:id] == 30}
        game = Game.all.last
        GameTurn.run(game)
    end
end