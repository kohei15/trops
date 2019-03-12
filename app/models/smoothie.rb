class Smoothie < ApplicationRecord
  has_many :smoothie_foods
  has_many :favorites,dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :smoothie_name, presence: true

   def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
