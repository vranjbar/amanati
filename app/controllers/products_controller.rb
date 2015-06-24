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
    
  end

  def edit
  end

  def delete
  end
end
