class HomepageController < ApplicationController
  def index
    @categories = Category.all
    @brands = Brand.all
  end
end
