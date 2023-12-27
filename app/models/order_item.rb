class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :invoice, optional: true
  before_save :set_unit_price
  before_save :set_total
  delegate  :name,:new_price, to: :product
  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.new_price
    end
  end

  def total
    return unit_price.to_s.to_d * quantity.to_s.to_d
  end

  private
  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total.to_s.to_d * quantity.to_s.to_d
  end
end
