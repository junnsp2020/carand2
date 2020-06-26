class Users::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products.order(created_at: :desc).page(params[:page]).per(28)
    else
      @products = Product.all.order(created_at: :desc).page(params[:page]).per(28)
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_comment = ProductComment.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    if @product.persisted?
      redirect_to product_path(@product.id)
    else
      flash[:notice] = "投稿画像が有効ではありません"
      redirect_to new_product_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:category_id, :user_id, :name, :image, :introduction, :status, :price, :profit, :postage, :postage_responsibility, :sale_status, :propriety, :notice, :barter_propriety)
  end
end
