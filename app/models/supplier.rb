class Supplier < ApplicationRecord

  has_many :products, dependent: :destroy
  default_scope {where("deleted_at IS NULL")}

end
