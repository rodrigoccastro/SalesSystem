class Product < ApplicationRecord
    validates :id,  presence: true
    validates :name,  presence: true
    validates :price,  presence: true
    has_many :productsales
end
