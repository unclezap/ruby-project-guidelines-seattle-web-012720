class Shuffle < ActiveRecord::Base
    belongs_to :game
    belongs_to :card
    belongs_to :list
end