class List < ActiveRecord::Base
    belongs_to :game
    has_many :shuffles
end