class ProductsController < ApplicationController
  
  before_action :require_login
  def require_login
    unless current_user
      flash[:error] = "you must login dude"
      redirect_to sign_in_path
    end
  end

	def index
		@products = Product.paginate(:page => params[:page], :per_page => 10)
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
		params.require(:product).permit(:nama_lembaga, :alamat_lengkap, :desa, :kecamatan, :kabupaten, :no_akte)
	end

end
