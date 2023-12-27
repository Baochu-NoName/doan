class AddInvoiceIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :invoice_id, :integer
  end
end
