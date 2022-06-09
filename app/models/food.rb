class Food < ApplicationRecord
  belongs_to :user_id
  has_many :orders, dependent: :destroy
  # has_many :users, through: :orders
  has_many :comments, dependent: :destroy

  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end
