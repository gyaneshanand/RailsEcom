class SellerCatalogController < ApplicationController
def index
  	@seller_catalog = SellerCatalog.all
  	render json: @seller_catalog
  end

  def create
  	@seller_catalog = SellerCatalog.new(user_params)
  	if @seller_catalog.save!
  		render json: @seller_catalog
  	else
  		render error: { error: "Error occured in creating Seller Catalog"} , status: 400
  	end
  end

  def show
  	@seller_catalog = SellerCatalog.find(params[:id])
  	render json: @seller_catalog
  end

  private
  	def user_params
  		params.require(:seller_catalog).permit(:price,:quantity,:user_id,:product_id)
  	end
end
