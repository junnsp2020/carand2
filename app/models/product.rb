class Product < ApplicationRecord
  attachment :image

  def postage
    postage = 1000
  end

  def favorited_by?(user)
    if user
      favorites.where(user_id: user.id).exists?
    else
      return nil
    end
  end

  def wished_by?(user)
    if user
      wishlists.where(user_id: user.id).exists?
    else
      return nil
    end
  end

  enum postage_responsibility:{
    "出品者負担": 0,
    "購入者負担": 1
  }
  enum sale_status:{
    "販売中": 0,
    "売り切れ": 1,
    "交換済": 2
  }
  enum status:{
  	"新品・未使用": 0,
  	"未使用に近い": 1,
  	"目立った傷や汚れ無し": 2,
  	"傷や汚れあり": 3,
  	"全体的に状態が悪い": 4
  }
  enum propriety:{
  	"交換不可": 0,
  	"交換可能": 1
  }

  has_one :trading, autosave: true, dependent: :destroy
  belongs_to :user
  belongs_to :category
  has_many :barter_requests

  private
    def build_child
      build_trading
    end
end
