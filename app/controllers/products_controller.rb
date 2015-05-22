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
		@product = Product.find(params.require(:id))
		render :new
	end

	def update
		product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
		@product = Product.find(params.require(:id))
		if @product.update(product_params)
			redirect_to products_url
		else
			render :new
		end
	end

	def create
		product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
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
end