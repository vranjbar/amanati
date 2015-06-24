class ProductsController < ApplicationController
  layout "main_layout"
  def index

  end

  def show
    @pro = Product.new
  end

  def new
    @product = Product.new
  end

  def create
    redirect_to(:controller => 'products', :action => 'new')
  end

  def edit
  end

  def delete
  end
end
