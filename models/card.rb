class Card < ActiveRecord::Base
    has_many :shuffles
    has_many :games, through: :shuffles
end