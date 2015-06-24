class ProductsController < ApplicationController
  layout "main_layout"
  $myCity =  ['اراک', 'اردبیل', 'اصفهان', 'اهواز', 'ایلام', 'بجنورد', 'بندرعباس', 'بوشهر', 'بیرجند', 'ارومیه', 'تبریز', 'تهران', 'خرم آباد', 'رشت', 'زاهدان', 'زنجان', 'ساری', 'سمنان', 'سنندج', 'شهرکرد', 'شیراز', 'قزوین', 'قم', 'کرج', 'کرمان', 'کرمانشاه', 'گرگان', 'مشهد', 'همدان', 'یاسوج', 'یزد']

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
