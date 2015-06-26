class UsersController < ApplicationController
  layout "main_layout"
  
  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
  end

  def new
    @user = User.new 
  end
  
  def create
      @user = User.new(user_params)   
      if @user.save
        flash[:success] = "از اینکه امانتی را انتخاب کردید سپاسگزاریم، برای استفاده از امکانات بیشتر لطفا وارد شوید!"
        render 'sessions/new'
      else
        render 'new'
      end
  end

  def edit
    if logged_in?
      @user = User.find(session[:user_id])
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
  end

  def delete
  end

  def update
    if logged_in?
      @user = User.find(session[:user_id])
      if @user.update_attributes(user_params)
        flash[:success] = "مشخصات کاربری با موفقیت ویرایش شد"
        redirect_to(:action=>'show', :id => session[:user_id])
      else
        flash[:danger] = "در ثبت اطلاعات خطایی رخ داد. لطفا دوباره تلاش کنید."
        redirect_to(:action=>'edit', :id => session[:user_id])
      end
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
    
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :user_name, :hashed_password, :email, :province, :city, :address, :phone_number , :photo )
    end
end
