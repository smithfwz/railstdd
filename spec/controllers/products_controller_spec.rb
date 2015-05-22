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

	describe '#create' do
		def do_request
			post :create, product: params
		end

		context 'Success' do 
			let(:params) { attributes_for(:product, category_id: category.id)}
			let!(:category){ create(:category) }
			it 'save a product' do
				expect{ do_request }.to change(Product, :count).by(1)
				expect(response).to redirect_to products_url
			end

		end

		context 'Fail' do 
			let(:params) { attributes_for(:product, title: '') }
			it 'render new on failure' do
				post :create, product: attributes_for(:product, title: '')
				expect(response).to render_template :new
			end 
		end
	end
end