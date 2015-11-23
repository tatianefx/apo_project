class Technical < ActiveRecord::Base
	has_and_belongs_to_many :apos
	has_and_belongs_to_many :categories
end
