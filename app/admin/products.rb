ActiveAdmin.register Product do

  # Strong parameters trong Rails
  # cho phép Rails controllers nhận giá trị truyền từ views
  # Cho các thuộc tính được khai báo dưới đây

  permit_params :image, :name, :description, :price, :year, :new_price, :available,:per_page
  
  index do
  selectable_column
  id_column
  column :name do |product|
  link_to "#{product.name}", admin_product_path(product)
end
  column :image 
  column :description
  column "Old Price", :price
  column "New Price", :new_price
  column :year
  actions
  end 
  # Cho phép admin search theo các thuộc tính này tại trang index
  filter :name
  filter :price
  # Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
  form do |f|
    f.inputs "Products Details" do
    f.input :name
    f.input :image
    f.input :description
    f.input :price
    f.input :new_price
    f.input :year
  end
  f.actions
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :name, :description, :price, :year]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
  
end
