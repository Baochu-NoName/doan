class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  # GET /carts/1 or /carts/1.json
  def show
    @order_items = current_order.order_items
  end


  private
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice:"That cart doesn't exist"
    end
end
