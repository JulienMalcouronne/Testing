class Product < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than: 1.00 }
end
