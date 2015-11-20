class Answer < ActiveRecord::Base
	has_many :answers_rooms
	has_many :answers_qualifiers
	has_many :answers_categories
	has_many :answers_attributes
	has_many :answers_concepts_qualifiers
	has_many :answers_concepts

	has_many :rooms, through: :answers_rooms
	has_many :qualifiers, through: :answers_qualifiers
	has_many :categories, through: :answers_categories
	has_many :attributes, through: :answers_attributes
	has_many :concepts, through: :answers_concepts_qualifiers
	has_many :qualifiers, through: :answers_concepts_qualifiers
	has_many :concepts, through: :answers_concepts
end
