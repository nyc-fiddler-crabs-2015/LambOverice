class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      key, value = user.errors.messages.first
      session[:message] = "#{key.to_s} #{value.first}"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end