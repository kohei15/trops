class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :smoothie

  validates :user_id, presence: true
  validates :smoothie_id, presence: true

end
