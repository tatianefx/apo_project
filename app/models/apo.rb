class Apo < ActiveRecord::Base
	has_many :apos_technicals

	has_many :technicals, through: :apos_technicals
end
