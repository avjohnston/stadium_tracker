class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome to your dashboard, #{user.name}!"
      redirect_to user_dashboard_index_path(user)
    else
      flash[:error] = 'Credentials do not match'
      render :login_form
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
