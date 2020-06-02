class Users::UsersController < ApplicationController
  before_action :current_user, except: [:delete]

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :phone_number, :bank_name, :account_type, :branch_code, :account_number, :account_last_name_kana, :account_first_name_kana, :buyer_id, :seller_id, :balance, :request_amount, :image, :nickname, :introduction)
  end
end
