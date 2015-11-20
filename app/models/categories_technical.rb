class CategoriesTechnical < ActiveRecord::Base
  belongs_to :category
  belongs_to :technical
end
