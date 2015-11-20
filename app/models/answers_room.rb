class AnswersRoom < ActiveRecord::Base
  belongs_to :answer
  belongs_to :room
end
