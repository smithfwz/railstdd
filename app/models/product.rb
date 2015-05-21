class Product < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :price, presence: true, numericality: {greater_than: 0}

	belongs_to :category
	
end