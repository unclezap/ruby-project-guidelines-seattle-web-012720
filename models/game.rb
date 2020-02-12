class Game < ActiveRecord::Base
    belongs_to :player
    has_one :list
    has_many :shuffles
    has_many :cards, through: :shuffles
end