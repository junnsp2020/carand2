class Trading < ApplicationRecord
	belongs_to :buyer, class_name: "User"
	belongs_to :seller, class_name: "User"
	belongs_to :product
	belongs_to :user
	has_many :trading_messages

	enum paymethod:{
		"クレジットカード": 0,
		"コンビニ払い": 1,
		"交換": 2
	}
	enum payment_status:{
		"出品者へ入金報告をする": 0,
		"入金報告をしました。出品者の発送待ちです": 1,
		"受取報告をする": 2,
		"ご利用誠にありがとうございました！": 3,
		"交換(購入者)": 4,
		"番号確認完了(購入者)": 5,
		"交換お疲れ様でした(購入者)": 6
	}
	enum shipment_status:{
		"出荷報告をする": 0,
		"出荷を通知しました。購入者の評価待ちです": 1,
		"購入者を評価する": 2,
		"取引完了": 3,
		"交換(出品者)": 4,
		"番号確認完了(出品者)": 5,
		"交換お疲れ様でした(出品者)": 6
	}
end
