class Concept < ActiveRecord::Base
	has_many :answers_concepts
	has_many :answers_concepts_qualifiers

	has_many :answers, through: :answers_concepts
	has_many :answers, through: :answers_concepts_qualifiers
	has_many :qualifiers, through: :answers_concepts_qualifiers
end
