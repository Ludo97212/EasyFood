class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :score, presence: true
  validates :score, inclusion: { in: [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0],
                                 message: "%{value} is not a valid size" }
  validates :comment, length: { in: 3..250 }
end
