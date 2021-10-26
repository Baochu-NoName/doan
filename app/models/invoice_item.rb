  class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :order_item
end
