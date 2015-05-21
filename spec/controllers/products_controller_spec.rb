require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe '#index' do
		let!(:products) { create_list(:product, 2)}

		it 'gets a list of products' do
			get :index
			expect(assigns(:products).size).to eq products.size
		end 
	end

	describe '#show' do
		let!(:product){ create(:product) }

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