class ProductsController < ApplicationController
  layout "main_layout"
  $myCity =  ['اراک', 'اردبیل', 'اصفهان', 'اهواز', 'ایلام', 'بجنورد', 'بندرعباس', 'بوشهر', 'بیرجند', 'ارومیه', 'تبریز', 'تهران', 'خرم آباد', 'رشت', 'زاهدان', 'زنجان', 'ساری', 'سمنان', 'سنندج', 'شهرکرد', 'شیراز', 'قزوین', 'قم', 'کرج', 'کرمان', 'کرمانشاه', 'گرگان', 'مشهد', 'همدان', 'یاسوج', 'یزد']

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
