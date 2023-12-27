class HomepageController < ApplicationController
  def index
    @categories = Category.all
    @brands = Brand.all
    @products = Product.all.limit(6)
  end
end
