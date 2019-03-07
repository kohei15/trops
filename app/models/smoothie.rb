class Smoothie < ApplicationRecord
  has_many :favorites
  has_many :smoothie_foods
  belongs_to :user
end
