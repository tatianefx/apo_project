class Room < ActiveRecord::Base
	has_many :answers_rooms
	has_many :answers, through: :answers_rooms
end
