class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 6)
  end
  def show
    @order_item = current_order.order_items.new
    @reviews = Review.where(product_id: @product.id).order('created_at DESC')
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
    @invoices = current_user.invoices.all
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
