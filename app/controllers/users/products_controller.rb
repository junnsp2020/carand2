class Users::ProductsController < ApplicationController
  def new
  	@products = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.user_id = current_user.user_id
  	if @product.postage_responsibility == "出品者負担"
  	  @product.price += 0
  	  @product.save
  	else
  	  @product.price += @product.postage
  	  @product.save
  	end
  	if @product.persisted?
  	  redirect_to product_path(@product.id)
  	else
  	  flash[:notice] = "投稿画像が有効ではありません"
  	  redirect_to new_product_path
  	end
  end

  	private
  	def product_params
      params.require(:product).permit(:category_id, :user_id, :name, :image, :introduction, :status, :price, :postage, :postage_responsibility, :sale_status, :propriety, :notice, :barter_propriety)
    end
  end
