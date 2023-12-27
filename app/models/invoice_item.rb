class InvoiceItem < ApplicationRecord
	belongs_to :invoice
	# validates :product_image, presence: true
	validates :product_name, presence: true
	validates :product_unit_price, presence: true
	validates :product_quantity, presence: true
end
