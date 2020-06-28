class Users::UsersController < ApplicationController
  before_action :current_user, except: [:delete]

  def show
  	@user = User.find(params[:id])
  end

  def userinfo
  	@user = current_user
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user)
  	end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.request_amount == nil
      @user.request_amount =0
      @user.save
    end
    if @user.balance && @user.request_amount && @user.balance >= @user.request_amount
      @user.balance -= @user.request_amount
    end
    current_user.save
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :phone_number, :bank_name, :account_type, :branch_code, :account_number, :account_last_name_kana, :account_first_name_kana, :buyer_id, :seller_id, :balance, :request_amount, :image, :nickname, :introduction)
  end
end
