class Camp < ActiveRecord::Base
	has_many :foods
	has_many :midicines
	has_many :outbreaks
	belongs_to :user
end
