class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(product)
	end

	private

	def product
		params.require(:id)
	end
end