class AnswersQualifier < ActiveRecord::Base
  belongs_to :answer
  belongs_to :qualifier
end
