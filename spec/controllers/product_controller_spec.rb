require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	describe '#index' do
		let(:category) { Category.new(title: 'Book') }
		let!(:products) do
			products = []
			products << Product.create!(title: 'Ruby', description: 'Ruby book', price: 12, category: category)
			products << Product.create!(title: 'Ruby', description: 'Ruby book', price: 12, category: category)
		end

		it 'gets a list of products' do
			get :index
			expect(assigns(:products)).to eq products
		end 
	end
end