class MainPagesController < ApplicationController
layout "main_layout"
  def home
  end

  def about
  end

  def contact

  end

  def sendmail
  	render :action => 'home'
  end
end
