class Sale < ApplicationRecord
  validates :client_id, presence: true
  validates :seller_id, presence: true
  belongs_to :client
  belongs_to :seller
  has_many :productsales
end
