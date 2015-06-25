class ProductsController < ApplicationController
  layout "main_layout"
  $myCity =  ['تهران','اراک', 'اردبیل', 'اصفهان', 'اهواز', 'ایلام', 'بجنورد', 'بندرعباس', 'بوشهر', 'بیرجند', 'ارومیه', 'تبریز', 'خرم آباد', 'رشت', 'زاهدان', 'زنجان', 'ساری', 'سمنان', 'سنندج', 'شهرکرد', 'شیراز', 'قزوین', 'قم', 'کرج', 'کرمان', 'کرمانشاه', 'گرگان', 'مشهد', 'همدان', 'یاسوج', 'یزد']
  $myCategory =  ['کتاب', 'تفریحی', 'لوازم شخصی', 'لوازم الکترونیکی', 'لوازم خانگی', 'املاک', 'خودرو']
  def index

  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)   
      if @product.save
        flash[:success] = "آگهی مورد نظر ثبت گردید."
        render 'show', :locals => {:id => "2"}
      else
        flash[:success] = "خطا"
        render 'new'
      end
  end

  def edit
    @product = Product.new
  end

  def edit_choose
  end

  def delete
  end

  private
    def product_params
      params.require(:product).permit(:name, :category_id, :user_id, :description, :price, :city, :address, :phone_number,:email, nil, :image, nil)
    end
end