class OrderItemsController < ApplicationController
	before_action :set_order
	before_action :set_order_item
	
	def create	
	 	if @order.order_items.exists?(product_id: params[:order_item][:product_id])
			@order_items = current_order.order_items.where(product_id: params[:order_item][:product_id])
	 		@order_items.each do |item|
		 		item.quantity += order_item_params[:quantity].to_i
		 		item.update(quantity: item.quantity)
	 		end
		else
	 		@order_item = @order.order_items.new(order_item_params)
		 	@order.save
			session[:order_id] = @order.id
			@order_item.save
		end
	    	
		if @order_item.save
		 	flash[:notice] = "Add to cart succesfullly"
		 	flash.keep(:notice)
		 	redirect_to carts_path
		else
		 	flash[:notice] = "Cannot add items. Please check again"
		 	flash.keep(:notice)
		 	redirect_to products_path
		end
	end
		

	def update
	    @order_item = @order.order_items.find(params[:id])
	    @order_item.update(order_item_params)
	    @order_items = current_order.order_items
	    flash[:notice] = "Updated succesfully!"
    	redirect_to carts_path
	end
	
	def destroy
	    @order_item = @order.order_items.find(params[:id])
	    @order_item.destroy
	    @order_items = current_order.order_items
	   	redirect_to carts_path
	end


	private
  	def order_item_params
    	params.require(:order_item).permit(:cart_id, :order_id,:invoice_id,:product_id, 
    		:quantity,
    		:total, 
    		:unit_price)
  	end
  	def set_order_item
  		@order_item = OrderItem.find_by(params[:id]) 
  	end

  	def set_order
    	@order = current_order
  	end
end
