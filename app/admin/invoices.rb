ActiveAdmin.register Invoice do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :status, :total, :username, :phone_number, 
  :order_id, :user_id,
  invoice_items_attributes: [:id, :product_name, :product_unit_price, :product_quantity]
   index do
    selectable_column
    id_column
    column :username
    column :phone_number
    column :status
    column "Total", :total do |invoice|
      number_to_currency invoice.total
    end
    actions
  end

  # hiển thị thông tin invoices(chế độ xem)
  show do
    panel "Invoice Info" do
      attributes_table_for invoice do
        row :id
        row :username
        row :phone_number
        row :created_at
        row :updated_at
        row :status
        row "Total", :total do |invoice|
          number_to_currency invoice.total
        end
      end    
    end
    panel "Product Details" do
      table_for invoice.invoice_items do
        column :product_name
        column :product_quantity 
        column "Unit Price", :product_unit_price do |unit|
          number_to_currency unit.product_unit_price 
        end
        column :created_at   
      end    
    end
  end


  form do |f|
    f.inputs "Invoice Details" do
      f.input :status, as: :select, collection: Invoice::STATUS_OPTIONS
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:status, :total, :username, :phone_number, :order_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
