class Word < ApplicationRecord
  validates :content, presence: true, length: {maximum: 50}
  validates :meaning, presence: true, length: {maximum: 255}
  validates :example, presence: true, length: {maximum: 255}
  
  belongs_to :user
  
  has_many :favorites
  has_many :favorited, through: :favorites, source: :user
end
