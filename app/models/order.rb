class Order < ApplicationRecord
	has_many :order_items,dependent: :destroy
  	before_save :set_subtotal

    def subtotal
        order_items.collect {|order_item| order_item.valid? ? order_item.unit_price.to_s.to_d * order_item.quantity.to_s.to_d : 0}.sum
    end

    private
    def set_subtotal
        self[:subtotal] = subtotal    
    end
end
