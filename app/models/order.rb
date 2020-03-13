class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :order_items

end
