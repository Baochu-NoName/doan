class Invoice < ApplicationRecord
	attr_accessor :invoice_items_attributes
	has_many :invoice_items
	has_many :order_items, through: :invoice_items
	accepts_nested_attributes_for :invoice_items, allow_destroy: true
	STATUS_OPTIONS = %w(pending completed shipping shipped canceled)
	validates :invoice_status, inclusion: {in: STATUS_OPTIONS}, presence: true
end
