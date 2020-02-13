class Game < ActiveRecord::Base
    belongs_to :player
    has_one :list
    has_many :shuffles
    has_many :cards, through: :shuffles

    def self.high_score
        highest = -1
        i = 0
        highest_index = 0
        self.all.each do |game_record|
            if game_record[:tricks_taken] > highest
                highest = game_record[:tricks_taken]
                highest_index = i
            end
            i += 1
        end
        20.times {puts ""}
        puts "The high score is #{highest}, which was achieved by #{self.all[highest_index].player[:name]}"
        @highest = highest
        self.score_message

    end
    
    def self.score_message
        if @highest == 27
            puts ""
            puts "THAT WAS A PERFECT GAME HOLY CRAP"
        elsif @highest > 23
            puts ""
            puts "Wow, you almost can't get better than that without some luck"
        elsif @highest > 18
            puts ""
            puts "Hot damn"
        elsif @highest > 12
            puts ""
            puts "pretty nice"
        elsif @highest > 6
            puts ""
            puts ":|"
        else
            puts ""
            puts ":'("
        end
        2.times {puts ""}
        puts "Press enter to continue"
        gets
        ViewStats.run
    end
end