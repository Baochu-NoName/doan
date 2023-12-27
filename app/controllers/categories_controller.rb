class CategoriesController < InheritedResources::Base
  before_action :set_cat, only: [:index, :show]
  def index 
    @categories = Category.all.order(name: :desc)
  end
  
  private
    def set_cat
      @category = Category.find_by(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end

end
