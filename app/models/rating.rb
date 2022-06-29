class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :score, presence: true
  validates :score, inclusion: { in: 0.0..5.0 }
  validates :comment, length: { in: 3..250 }
end
