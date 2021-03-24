class UsersController < ApplicationController
  def new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create!(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome to your dashboard, #{new_user.name}!"
      redirect_to user_dashboard_index_path(new_user)
    else
      render :new
      flash[:error] = new_user.errors.full_messages.to_sentence
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
