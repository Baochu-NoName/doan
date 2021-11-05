ActiveAdmin.register User do

#hiển thị thông tin user(chế độ xem)
  show do
    panel "User Details" do
      attributes_table_for user do
        row :name
        row :created_at
        row :updated_at
        row :email
        row :is_active
        row :phone 
      end    
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #permit_params :name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #Cho phep cac tham so duoc hien thi tren man hinh
  permit_params :id, :name ,:email, :created_at, :updated_at, :is_active, :phone, :password
  #scope
  scope :all
  scope :active
  scope :inactive
  #Loc theo ten, email
  filter :name
  filter :email
  filter :address
  #tao bang
  index do
  selectable_column
  #click vao ten chuyen huong toi User details page
  column :name do |user|
     link_to "#{user.name}",  admin_user_path(user)
   end
 
  column :email
  column :phone
  column :created_at
  column :updated_at
  column :Address
  #Them vao status_tag cho column is_active
  column :is_active do |s|
   s.active_for_authentication? ? status_tag(I18n.t("yes"), class:"account_active") : status_tag(I18n.t("no"), class:"account_inactive")
  end
  actions 
  end


  #tao 1 form moi ten User Details
  form do |f|
      f.inputs "Edit User" do
      f.input :name
      f.input :phone
      f.input :password
      f.input :is_active
      dropdown_menu "Address" do
        item "Tinh"
        item "Huyen"
      end
      f.actions
      end
  end

  #Tro lai trang /admin/users
    action_item :name, only: :show do
       link_to "Back", admin_users_path
     end
     member_action :name, method: :get do
     redirect_to admin_user_path
     end 
    #Thay doi nut update trong edit user 
    #Thay doi cac field khac ma ko thay doi 
    #password user da tao(neu field password is blank) 
    controller do
    def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    super
  end
end
    #
    # or
    #
    # permit_params do
    #   permitted = [:name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
end
