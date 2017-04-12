class Product < ApplicationRecord

  belongs_to :supplier
  default_scope {where("deleted_at IS NULL")}

  @allowed_vat_values = [9,21]

  validates :vat, presence: true, :inclusion=> { :in => @allowed_vat_values}
  validate :check_purchase_price_and_sale_price


  private
  def check_purchase_price_and_sale_price
    errors.add(:sale_price, "can't be smaller than purchase price") if purchase_price < sale_price
  end
end
