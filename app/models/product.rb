 class Product < ApplicationRecord
	has_many :order_items, dependent: :destroy
	has_many :orders, through: :order_items
	has_many :invoices
	has_one_attached :image
	has_many_attached :images
	validates :new_price, numericality: {less_than_or_equal_to: :price,message: "New price less than old price"}, presence: true
end
