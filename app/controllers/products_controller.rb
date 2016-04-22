class ProductsController < ApplicationController
	skip_before_action :authenticate_user!
	def index
		@products = Product.all
	end

	def show
	    @product = Product.find(params[:id])
	    @cart_action = @product.cart_action @product.id
  	end

	private
    # Use callbacks to share common setup or constraints between actions.
	    def set_product
	      @product = Product.find(params[:id])
	    end
		# Never trust parameters from the scary internet, only allow the white list through.
		def product_params
			params.require(:product).permit(:title, :release_year, :price, :description, :imdb_id, :poster_url)
		end
end
