class ProductController < ApplicationController
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 6)
  end

  private 
  def product_params
    params.require(:product).permit(:name, :image, :description,:price,:new_price,:released_at,:sold_quantity,:rating)
  end
end
