class ProductsController < ApplicationController
  layout "main_layout"
  def index
    if params[:title] != nil
      @product = Product.search_name(params[:title])
    end
    if params[:category_id] != nil
      @category = Category.get_id(params[:category_id])
      @product = Product.search_category(@category.id)
    end
    if params[:city_id] != nil
      @product = Product.search_city(params[:city_id])
    end
    if params[:prsiceStrart] != nil
      @product = Product.over_price(params[:prsiceStrart])
    end
    if params[:title] != nil
      @product = Product.under_price(params[:prsiceStrart])
    end
    if params[:title] != nil
      @product = Product.search_name(params[:title])
    end
    if params[:title] != nil
      @product = Product.search_name(params[:title])
    end
  end

  def show
    @product = Product.find(params[:id])
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
