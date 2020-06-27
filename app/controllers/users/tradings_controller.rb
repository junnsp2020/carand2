class Users::TradingsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@trading = Trading.new
		@barter_request = BarterRequest.find_by(product_id: @product.id, user_id: current_user.id)
	end

	def show
		@trading = Trading.find(params[:id])
		@buyer = @trading.buyer
		@seller = @trading.seller
		@trading_message = TradingMessage.new
		@trading_messages = @trading.trading_messages
	end

	def create
		@product = Product.find(params[:product_id])
		@product.sale_status = "売り切れ"
		@trading = @product.trading
		@trading = Trading.new(trading_params)
		@trading.product_id = @product.id
		@trading.user_id = current_user.id
		@barter_request = BarterRequest.find_by(product_id: @product.id, user_id: current_user.id)
		@barter_request = BarterRequest.where(product_id: @product.id)
		if @barter_requests
			@barter_requests.each do |barter_request|
				barter_request.notice = false
				barter_request.save
			end
		end

		# if @barter_request && @barter_request.propriety == "許可する"
		# 	@trading.payment_status = "交換(購入者)"
		# 	@trading.shipment_status = "交換(出品者)"
		# end

		@trading.save(trading_params)
		@product.save
		redirect_to trading_path(@trading)
	end

	private
	def trading_params
		params.require(:trading).permit(:product_id, :user_id, :paymethod, :buyer_id, :seller_id, :payment_status, :shipment_status, :excellent_review, :good_review, :poor_review, :seller_excellent_review, :seller_good_review, :seller_poor_review, :buyer_notice, :seller_notice)
	end
end
