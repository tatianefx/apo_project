class AnswersAttribute < ActiveRecord::Base
  belongs_to :answer
  belongs_to :attribute
end
