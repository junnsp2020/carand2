class Product < ApplicationRecord
  attachment :image

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

  belongs_to :user
  belongs_to :category
end
