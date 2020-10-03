class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :words
  # フォロー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  # お気に入り機能
  has_many :favorites
  has_many :favorite_words, through: :favorites, source: :word
  # 画像アップロードの処理
  mount_uploader :image, ImageUploader
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def favorite(other_word)
      self.favorites.find_or_create_by(word_id: other_word.id)
  end
  
  def unfavorite(other_word)
    favorite = self.favorites.find_by(word_id: other_word.id)
    favorite.destroy if favorite
  end
  
  def favorite?(other_word)
    self.favorite_words.include?(other_word)
  end
end