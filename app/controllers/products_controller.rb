class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find_by_id(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@products = Product.all
		@product = Product.create(product_params)
	end

	def edit
		@product = Product.find_by_id(params[:id])
	end

	def update
		@products = Product.all
		@product = Product.find_by_id(params[:id])
		@product.update_attributes(product_params)
	end

	def delete
		@product = Product.find_by_id(params[:product_id])
	end

	def destroy
		@products = Product.all
		@product = Product.find_by_id(params[:id])
		@product.destroy
	end

	private
	def product_params
		params.require(:product).permit(:name, :price)
	end
end
