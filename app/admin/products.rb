ActiveAdmin.register Product do

  # Strong parameters trong Rails
  # cho phép Rails controllers nhận giá trị truyền từ views
  # Cho các thuộc tính được khai báo dưới đây

  permit_params :image, :name, :description, :price, 
  :sold_quantity, :new_price, :available,
  :per_page, :released_at,:rating, :created_at, :category_id, :brand_id, multiple_images: []
  
  index do
  selectable_column
  id_column
  column :name do |product|
  link_to "#{product.name}", admin_product_path(product)
  end
  column :image do |product|
    image_tag product.image, size:'50x50'
  end
 
  column :description do |product|
    truncate(product.description, length:10)
  end
  column "Old Price", :price do |product|
    number_to_currency product.price
  end
  column "New Price", :new_price do |product|
    number_to_currency product.new_price
  end
  column :released_at 
  column :created_at
  column :category
  column :brand
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
  filter :category
  filter :brand


show do
  panel "Product Details" do
    attributes_table_for product do
        row :name 
        row :image do |product|
          image_tag product.image, size:'50x50'
        end
       
        row :description
        row "Old Price", :price do |product|
          number_to_currency product.price
        end
        row "New Price", :new_price do |product|
          number_to_currency product.new_price
        end
        row :released_at 
        row :created_at
        row "Rating", :rating do |product|
        if product.rating.blank?
        else       
          render_stars(product.rating)
        end
      end
      row "Category", :category do |product|
          link_to "#{product.category.name}", admin_category_path
        end
        row "Brand", :brand do |product|
          link_to "#{product.brand.name}", admin_brand_path
        end

        row "Product Images" do
          table do
            product.multiple_images.each do |image|        
              td do
                image_tag image, size: '50x50'
              end
            end
          end
        end
    end
  end
end
  # Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
  form do |f|   
    f.inputs "Products Details" do
    f.input :name
    f.input :image, as: :file
    f.input :multiple_images, as: :file, input_html: { multiple: true }
    f.input :description 
    f.input :price
    f.input :new_price
    f.input :released_at
    f.input :sold_quantity 
    f.input :rating,as: :select,include_blank: false,collection: decimal_selection_array(1,5),selected: f.product.rating || 'Default'
    f.input :category_id,label: "Category",as: :select,include_blank: false, collection: Category.all.map{|c| [c.name, c.id]}
     f.input :brand_id,label: "Brand",as: :select,include_blank: false, collection: Brand.all.map{|b| [b.name, b.id]}
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
