class OrdersController < ApplicationController
	private
	def order_params
		params.require(:order).permit(:subtotal, :total,:user_id, :invoice_id)
	end
end
