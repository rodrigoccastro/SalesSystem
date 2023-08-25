class Productsale < ApplicationRecord
  validates :sale_id, presence: true
  validates :product_id, presence: true
  validates :product_name, presence: true
  validates :price, presence: true
  validates :quantity,  presence: true
  belongs_to :sale
  belongs_to :product
end
