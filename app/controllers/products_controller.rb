class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]

  def index
    checkProduct(params[:cate], params[:brand])
    @products_json = Product.all.order(name: :desc)
  end

  def show
    checkProduct(params[:cate], params[:brand])
    @order_item = current_order.order_items.new
    @reviews = Review.where(product_id: @product.id).order('created_at DESC')
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2) unless @reviews.average(:rating).nil?
    end
    @invoices = current_user.invoices.all if current_user
    @review = Review.new
  end

  def new
    @product = Product.find(params[:id])
  end

  private 
  def checkProduct(category = params[:cate], brand = params[:brand])     
    @categories = Category.all
    @brands = Brand.all
    if !category.nil?
      @products = Product.where(category_id: category).paginate(page: params[:page], per_page: 6)
    elsif !brand.nil?
      @products = Product.where(brand_id: brand).paginate(page: params[:page], per_page: 6)
    else
      @products = Product.search(params[:search]).paginate(page: params[:page], per_page: 6)
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :new_price, :released_at, :sold_quantity, :rating, :order_items, multiple_images: [])
  end
end
