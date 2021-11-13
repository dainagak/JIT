class Item < ApplicationRecord
  attachment :image
  # belongs_to :genre
  has_many :cart_items
  has_many :order_details

  def taxin_price
      price*1.1
  end

  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :price, {presence: true}

end