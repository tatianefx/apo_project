class AnswersCategory < ActiveRecord::Base
  belongs_to :answer
  belongs_to :category
end
