require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	let(:category) { Category.new(title: 'Book') }

	describe '#index' do
		let!(:products) do
			products = []
			products << Product.create!(title: 'Ruby', description: 'Ruby book', price: 12, category: category)
			products << Product.create!(title: 'Ruby', description: 'Ruby book', price: 12, category: category)
		end

		it 'gets a list of products' do
			get :index
			expect(assigns(:products).size).to eq products.size
		end 
	end

	describe '#show' do
		let!(:product){ Product.create!(title: 'Ruby', description: 'This is a ruby book', price: 12, category: category) }

		it 'displays a product' do
			get :show, id: product
			expect(assigns(:product).id).to eq product.id
		end
	end

	describe '#new' do
		it 'assigns an empty product instance' do
			get :new
			expect(assigns(:product)).to be_a Product
		end
	end
end