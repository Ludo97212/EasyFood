class Food < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy

  validates :name, :price, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end
