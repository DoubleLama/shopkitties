class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  has_one_attached :cat_picture

  validates :title, :price, :image_url, presence: true
  validates :title, length: {in: 3..20}
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }

  scope :filter_by_price, -> (price) { where price: price }

end
