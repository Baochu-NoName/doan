class AddProductIdToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :product_id, :integer
  end
end
