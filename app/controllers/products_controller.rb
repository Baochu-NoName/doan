class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 6)
  end
  def show
    @order_item = current_order.order_items.new
  end


  def new
    @product = Product.find(params[:id])
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name, :image, :description,:price,:new_price,:released_at,:sold_quantity,:rating, :order_items)
  end
end
