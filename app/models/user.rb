class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :smoothies
  has_many :favorites

  validates :name, presence: true

  # 管理者権限
  enum role: {user: 0, admin: 1}
end
