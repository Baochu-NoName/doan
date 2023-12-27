class AddInvoiceIdToInvoiceItems < ActiveRecord::Migration[6.1]
  def change
    add_column :invoice_items, :invoice_id, :integer
  end
end
