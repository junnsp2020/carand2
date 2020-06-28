class Users::BarterRequestsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@barter_request = BarterRequest.new
		@barter_request = BarterRequest.find_by(product_id: @product.id, user_id: current_user.id)
	end
end
