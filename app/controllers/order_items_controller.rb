class OrderItemsController < ApplicationController
	before_action :set_order
	def create	
		@order_item = @order.order_items.new(order_params)
		@order.save
	    session[:order_id] = @order.id
	    flash[:notice] = "Add to cart succesfullly"
	    redirect_back(fallback_location: products_path)
	end
		

	def update
	    @order_item = @order.order_items.find(params[:id])
	    @order_item.update(order_params)
	    @order_items = current_order.order_items
	    flash[:notice] = "Updated succesfully!"
    	redirect_to carts_path
	end
	
	def destroy
	    @order_item = @order.order_items.find(params[:id])
	    @order_item.destroy
	    @order_items = current_order.order_items
	    render js: "window.location.href = '/carts';"
	end


	private
  	def order_params
    	params.require(:order_item).permit(:product_id, :quantity, :cart_id)
  	end

  	def set_order
    	@order = current_order
  	end
end
