class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :score, presence: true
  validates :score, numericality: { only_integer: true }, on: [:create, :update]
  validates :score, inclusion: { in: (0..5), message: "%{value} is not a valid size" }
  validates :comment, length: { in: 3..500 }
end
