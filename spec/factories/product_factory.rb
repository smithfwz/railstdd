FactoryGirl.define do
	factory :product do
		title 'Ruby book'
		description 'This is a ruby book'
		price 12.99
		published true
		# category { Category.create!(title: 'Book')} type 1
		association :category
	end
end