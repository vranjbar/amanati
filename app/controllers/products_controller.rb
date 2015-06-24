class ProductsController < ApplicationController
  layout "main_layout"
  def index
    if params[:query] == nil
      @pro = Product.newest_first
    else
      @pro = Product
  end

  def show
    @pro = Product.find(params[:id])
  end

  def new
    @pro = Product.new
  end

  def edit
  end

  def delete
  end
end
