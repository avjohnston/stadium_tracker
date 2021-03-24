class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:succes] = "Welcome to Ballpark Tracker #{user.name}!"
      redirect_to user_dashboard_index_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end 
  end
end
