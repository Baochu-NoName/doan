class AddUserIdToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :user_id, :integer
  end
end
