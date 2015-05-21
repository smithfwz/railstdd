require 'rails_helper'

RSpec.describe Product, type: :model do
	context 'Validation' do
		it { should validate_presence_of :title }
		it { should validate_presence_of :description}
		it { should validate_presence_of :price}
		it { should validate_numericality_of(:price).is_greater_than(0) }
	end

	context 'Association' do
		it { should belong_to(:category)}
	end

	context '#strip_html_description' do
		let!(:product) do
			Product.new(description: '<h1>ruby book</h1>')
		end 

		it 'strips HTML from description before validating' do
			product.validate
			expect(product.description).to eq 'ruby book'
		end
	end

	describe '#make_title_lowercase' do
		let!(:product) { Product.new(title: 'RUBY') }

		it 'make the title lower before validating' do
			product.validate
			expect(product.title).to eq 'ruby'
		end
	end

	context '#title_is_shorter_than_description' do
		let!(:product) { Product.new(title: 'this is a ruby book', description: 'ruby book', price: 12)}

		it 'title is shorter than description' do
			product.validate
			expect(product.errors.messages).to include(description: ["can't be shorter than title"])
		end
	end
end