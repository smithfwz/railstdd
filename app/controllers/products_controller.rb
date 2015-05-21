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

	private

	def product_id
		params.require(:id)
	end
end