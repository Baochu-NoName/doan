ActiveAdmin.register Invoice do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :invoice_status
  index do
    selectable_column
    id_column
    column :invoice_status
    actions 
  end

  form do |f|
    f.inputs "Invoices Details" do
      f.input :invoice_status,as: :select,collection: Invoice::STATUS_OPTIONS    
    end
    f.actions
  end

  controller do
  def create
     create! { |success, failure|
     success.html do
       redirect_to admin_invoices_path, :notice => "Resource created successfully."
     end
     failure.html do
       flash[:error] = "Error(s) : #{resource.errors.full_messages.join(',')}"
       redirect_to :back 
     end
   }
 end
end
  #
  # or
  #
  # permit_params do
  #   permitted = [:invoice_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
