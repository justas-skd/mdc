class Product < ApplicationRecord
  @allowed_vat_values = [9,21]
  belongs_to :supplier
  validates :vat, presence: true, :inclusion=> { :in => @allowed_vat_values}
  validate :check_purchase_price_and_sale_price

  def check_purchase_price_and_sale_price
    errors.add(:sale_price, "can't be smaller than purchase price") if purchase_price < sale_price
  end
end
  # message: :vat" is not in @{allowed_vat_values}"}
  #length: { minimum: 3 }
