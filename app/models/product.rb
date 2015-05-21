class Product < ActiveRecord::Base
	# extend Enumerize
	validates :title, :description, :category, presence: true
	validates :price, presence: true, numericality: {greater_than: 0}
	validate :title_is_shorter_than_description

	belongs_to :category

	before_validation :strip_html_from_description, :make_title_lowercase

	def strip_html_from_description
		self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
	end

	def make_title_lowercase
		self.title = self.title.downcase unless self.title.nil?
	end
	
	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:description, 'can\'t be shorter than title')
		end
	end
end