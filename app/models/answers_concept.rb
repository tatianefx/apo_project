class AnswersConcept < ActiveRecord::Base
  belongs_to :answer
  belongs_to :concept
end
