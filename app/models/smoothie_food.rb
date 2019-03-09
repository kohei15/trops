class SmoothieFood < ApplicationRecord
  belongs_to :smoothie
  belongs_to :food
  has_one_attached :image

  validates :quantity, presence: true
end
