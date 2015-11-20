class Category < ActiveRecord::Base
	has_many :answers_categories
	has_many :categories_technicals

	has_many :answers, through: :answers_categories
	has_many :technical, through: :categories_technicals
end
