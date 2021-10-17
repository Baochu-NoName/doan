class ProductController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per_page(6)
  end
end
