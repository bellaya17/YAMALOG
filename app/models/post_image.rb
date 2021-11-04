class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, 
                    length: {maximum: 15}
                    
  validates :image, presence: true
  validates :text, length: {maximum: 50}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
