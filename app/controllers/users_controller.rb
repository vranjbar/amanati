class UsersController < ApplicationController
  layout "main_layout"
  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def delete
  end
end
