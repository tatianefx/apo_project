class Attribute < ActiveRecord::Base
	has_many :answers_attributes
	has_many :answers, through: :answers_attributes
end
