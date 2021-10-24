ActiveAdmin.register Product do

  # Strong parameters trong Rails
  # cho phép Rails controllers nhận giá trị truyền từ views
  # Cho các thuộc tính được khai báo dưới đây

  permit_params :image, :name, :description, :price, :sold_quantity, :new_price, :available,:per_page, :released_at, :rating
  
  index do
  selectable_column
  id_column
  column :name do |product|
  link_to "#{product.name}", admin_product_path(product)
  end
  column :image do |product|
    image_tag product.image, size:'50x50'
  end
 
  column :description
  column "Old Price", :price do |product|
    number_to_currency product.price
  end
  column "New Price", :new_price do |product|
    number_to_currency product.new_price
  end
  column :released_at 
  column "Rating", :rating do |product|
  if product.rating.blank?
  else       
    render_stars(product.rating)
  end
  end
  actions
  end 
  # Cho phép admin search theo các thuộc tính này tại trang index
  filter :name
  filter :new_price
  filter :released_at
  filter :sold_quantity
  filter :rating
  # Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
  form do |f|   
    f.inputs "Products Details" do
    f.input :name
    f.input :image, as: :file
    f.input :description 
    f.input :price
    f.input :new_price
    f.input :released_at
    f.input :sold_quantity 
    f.input :rating,as: :select,collection: decimal_selection_array(1,5),selected: f.product.rating || 'Default'
  end
  f.actions
  # or
  #
  # permit_params do
  #   permitted = [:image, :name, :description, :price, :year]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  end
end
