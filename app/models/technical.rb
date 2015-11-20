class Technical < ActiveRecord::Base
	has_many :apos_technicals
	has_many :categories_technicals

	has_many :apos, through: :apos_technicals
	has_many :categories, through: :categories_technicals
end
