class Food < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_one_attached :photo

  validates :name, :recipe, presence: true
  validates :recipe, length: { in: 100..2500 }
  # validates :category_id, inclusion: {in: Category.pluck(:id).prepend(nil) }
end
