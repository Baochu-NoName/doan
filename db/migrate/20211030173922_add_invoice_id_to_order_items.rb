class AddInvoiceIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :invoice_id, :integer
  end
end
