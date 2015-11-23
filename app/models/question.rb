class Question < ActiveRecord::Base
	has_many :questions_rooms
	has_many :qualifiers_questions
	has_many :categories_questions
	has_many :attributes_questions
	has_many :concepts_qualifiers_questions
	has_many :concepts_questions

	has_many :rooms, through: :questions_room
	has_many :qualifiers, through: :qualifiers_questions
	has_many :categories, through: :categories_questions

	has_many :concepts, through: :concepts_qualifiers_questions
	has_many :qualifiers, through: :concepts_qualifiers_questions

=begin
	has_many :attributes, through: :attributes_questions
	has_many :concepts, through: :concepts_questions
=end
end
