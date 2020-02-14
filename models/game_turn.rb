class GameTurn
    def self.run(game)
        # @game = game
        draw_results = DrawACard.run(game)
        binding.pry
        #[    Wait Until Unless function
            x = Time.now

            # require 'timeout'
            # y = 10
            # begin
            # status = Timeout::timeout(y) {
            #     puts x
            #     printf "Input: "
            #     gets
            # }
            # puts "Got: #{status}"
            # rescue Timeout::Error
            # puts "Input timed out after #{y} seconds"
            # puts "Time.now is #{Time.now}"
            # end
        # ]
        # ComputerTake.run(game, set) || PlayerTake.run(game, set)
        
        GameTurn.run
    end
end