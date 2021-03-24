class SessionsController < ApplicationController
  def new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create!(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome #{new_user.name}"
      redirect_to root_path
    else
      render :new
      flash[:error] = new_user.errors.full_messages.to_sentence
    end
  end

  def destroy
    
  end
end
