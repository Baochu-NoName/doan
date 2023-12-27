ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description
index do
  selectable_column
  id_column
  column "Category name", :name do |category|
    link_to "#{category.name}", admin_category_path(category)
  end
  column "Category description", :description do |category|
    truncate(category.description, length: 100)  
  end
  actions
end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
