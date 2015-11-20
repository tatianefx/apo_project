class AnswersConceptsQualifier < ActiveRecord::Base
  belongs_to :answer
  belongs_to :concept
  belongs_to :qualifier
end
