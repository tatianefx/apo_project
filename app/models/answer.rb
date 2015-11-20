class Answer < ActiveRecord::Base
	has_many :answers_rooms
	has_many :rooms, through: :answers_rooms
end
