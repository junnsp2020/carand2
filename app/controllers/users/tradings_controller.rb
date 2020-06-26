class Users::TradingsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@trading = Trading.new
		@barter_request = BarterRequest.find_by(product_id: @product.id, user_id: current_user.id)
	end
end
