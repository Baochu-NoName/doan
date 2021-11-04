class Invoice < ApplicationRecord
	has_many :order_items, dependent: :destroy
	has_many :invoice_items, dependent: :destroy
	has_many :products, through: :order_items
	has_and_belongs_to_many :orders
	belongs_to :user, optional: true
	accepts_nested_attributes_for :invoice_items, allow_destroy: true
	STATUS_OPTIONS = %w[pending completed approved shipping shipped]
	validates :status, inclusion: {in: STATUS_OPTIONS}
	validates :order_id, presence: true
	validates :user_id, presence: true
	# validates :invoice_id, presence: true
end
