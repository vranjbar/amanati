class SessionsController < ApplicationController
  layout "main_layout"
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.hashed_password==params[:session][:password]
    	log_in user
      	redirect_to user
    else
        flash.now[:danger] = 'نام کاربری و پسورد درست نیست' 
     	render 'new'
    end
  end

  def destroy
  end
end
