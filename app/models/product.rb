class Product < ApplicationRecord
  @allowed_vat_values = [9,21]
  belongs_to :supplier
  validates :vat, presence: true, length: { minimum: 3 } #:inclusion=> { :in => @allowed_vat_values}
  # validates :address, presence: true,
  #                   length: { minimum: 1 }

end
