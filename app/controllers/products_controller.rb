class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(product_id)
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(product_id)
		render :new
	end

	def update
		@product = Product.find(product_id)
		if @product.update(product_params)
			redirect_to products_url, notice: 'You have successfully updated a product.'
		else
			flash.now[:notice] = 'There is an error with your form.'
			render :new
		end
	end

	def destroy

		if Product.destroy(product_id)
			redirect_to products_url, notice: 'You have successfully deleted a product.'
		else
			redirect_to products_url, notice: 'There is an error when delete your product.'
		end
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_url
		else
			render :new
		end
	end

	private

	def product_id
		params.require(:id)
	end

	def product_params
		params.require(:product).permit(:title, :description, :price, :published, :category_id)
	end
end