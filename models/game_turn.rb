class GameTurn
    def self.run(game)
        DrawACard.run
        #[    Wait Until Unless function
            # x = Time.now

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
        ComputerTake.run || PlayerTake.run
        
        GameTurn.run
    end
end