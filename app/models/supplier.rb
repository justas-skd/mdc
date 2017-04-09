class Supplier < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 1 }
  validates :address, presence: true,
                    length: { minimum: 1 }


end
