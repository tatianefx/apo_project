class Qualifier < ActiveRecord::Base
	has_many :answers_concepts
	has_many :answers_concepts_qualifiers

	has_many :answers, through: :answers_concepts
	has_many :answers, through: :answers_concepts_qualifiers
	has_many :concepts, through: :answers_concepts_qualifiers
end
