class Users::UsersController < ApplicationController
  before_action :current_user, except: [:delete]

  def show
  	@user = User.find(params[:id])
  end
end
