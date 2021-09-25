class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #Hien thi thong tin tai khoan hoat dong hay khong hoat dong
  scope :active, ->{where.not(is_active:nil)}
  scope :inactive, ->{where(is_active:nil)}

  #Override phuong thuc active_for_authentication? xac nhan user da dang nhap hay chua
  def active_for_authentication?
      super && is_active?
  end
  #Khai bao method hien thi account_inactive tren man hinh user(xem them o devise.en.yml)
  def inactive_message
    is_active? ? super: :account_inactive
  end
end
