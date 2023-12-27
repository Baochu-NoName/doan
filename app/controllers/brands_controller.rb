class BrandsController < InheritedResources::Base
  before_action :set_brands
  private
    def set_brands
      @brand = Brand.find_by(params[:id])
    end
    def brand_params
      params.require(:brand).permit(:name, :description)
    end

end
