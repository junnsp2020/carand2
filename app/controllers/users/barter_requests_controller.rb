class Users::BarterRequestsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@barter_request = BarterRequest.new
		@barter_requests = BarterRequest.find_by(product_id: @product.id, user_id: current_user.id)
	end
    def index
    	@product = Product.find(params[:product_id])
    	@barter_requests = @product.barter_requests
    	@barter_request = BarterRequest.find_by(user_id: current_user.id, product_id: @product.id)
    end
    def create
    	@product = Product.find(params[:product_id])
    	@barter_request = BarterRequest.new(barter_request_params)
    	@barter_request.product_id = @product.id
    	@barter_request.user_id = current_user.id
    	@product.notice = false
    	@product.save
    	@barter_request.notice = false
    	if @barter_request.save
    		redirect_to product_barter_requests_path
    	else
    		render :new
    	end
    end
    private
    def barter_request_params
    	params.require(:barter_request).permit(:product_id, :user_id, :name, :image, :introduction, :comment, :product_condition, :propriety, :buyer_id, :seller_id, :notice)
    end
end
