class DrawACard
    def self.run(game)
        cards = game.shuffles
        binding.pry
        cards_in_deck = cards.find_all {|card| card[in_deck] == true}
        binding.pry
        if cards_in_deck == nil
            binding.pry
            WinLoseDraw.run(game)
        end
        
        CalculatePossibleSet.run
    end
end