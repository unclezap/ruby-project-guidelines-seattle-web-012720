class QuickRun
    def self.run
        game = Game.all.find {|game| game[:id] == 30}
        GameTurn.run(game)
    end
end