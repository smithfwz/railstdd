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
			let(:params) { build(:product).attributes }
	
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

	describe '#edit' do 
		let!(:product) { create(:product) }
		it 'edit a product' do 
			get :edit, id: product
			expect(assigns(:product).id).to eq product.id
		end
	end

	describe '#update' do 

		def do_request
			patch :update, id: product.id, product: params
		end

		let!(:product) { create(:product) }

		context 'success' do 
			let(:params) { attributes_for(:product, title: 'new title') }
			it 'update a product' do 
				do_request
				expect(product.reload.title).to eq 'new title'
			end
		end

		context 'Fail' do 
			let(:params) { attributes_for(:product, title: '') }
			it 'render new on failure' do 
				do_request
				expect(response).to render_template :new
			end
		end
	end

	describe '#destroy' do  
		let!(:product) { create(:product) }

		def do_request
			delete :destroy, id: product
		end

		it 'delete a product' do
			expect{ do_request }.to change(Product, :count).by(-1) 
		end
	end
end