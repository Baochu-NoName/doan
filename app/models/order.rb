class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items
    has_many :invoices, dependent: :destroy
    belongs_to :user, optional: true
  	before_save :set_subtotal
    validates :subtotal, presence: true
    accepts_nested_attributes_for :order_items, allow_destroy: true
    def subtotal
        order_items.collect {|order_item| order_item.valid? ? order_item.unit_price.to_s.to_d * order_item.quantity.to_s.to_d : 0}.sum
    end

    private
    def set_subtotal
        self[:subtotal] = subtotal    
    end
end
