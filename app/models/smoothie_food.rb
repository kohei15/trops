class SmoothieFood < ApplicationRecord
  belongs_to :smoothie
  belongs_to :food

  validates :quantity, presence: true
end
