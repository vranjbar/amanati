class ProductsController < ApplicationController
  layout "main_layout"
  $myCity =  ['اراک', 'اردبیل', 'اصفهان', 'اهواز', 'ایلام', 'بجنورد', 'بندرعباس', 'بوشهر', 'بیرجند', 'ارومیه', 'تبریز', 'تهران', 'خرم آباد', 'رشت', 'زاهدان', 'زنجان', 'ساری', 'سمنان', 'سنندج', 'شهرکرد', 'شیراز', 'قزوین', 'قم', 'کرج', 'کرمان', 'کرمانشاه', 'گرگان', 'مشهد', 'همدان', 'یاسوج', 'یزد']

  def index

    #initializi
    @product = nil

    if params[:title] != nil
      @product = Product.search_name(params[:title])
    end

    if params[:category_id] != nil
      @category = Category.get_id(params[:category_id])
      if @product == nil
        @product = Product.search_category(@category.id)
      else
        @product = @product.search_category(@category.id)
      end
    end

    if params[:city_id] != nil
      if @product == nil
        @product = Product.search_city(params[:city_id])
      else
        @product = @product.search_city(params[:city_id])
      end
    end

    if params[:priceStart] != nil
      if @product == nil
        @product = Product.over_price(params[:priceStart])
      else
        @product = @product.over_price(params[:priceStart])
      end
    end

    if params[:priceEnd] != nil
      if @product == nil
        @product = Product.under_price(params[:priceEnd])
      else
        @product = @product.under_price(params[:priceEnd])
      end
    end

    if params[:dateStart] != nil
      if @product == nil
        @product = Product.after_date(params[:dateStart])
      else
        @product = @product.after_date(params[:dateStart])
      end
    end

    if params[:dateEnd] != nil
      if @product == nil
        @product = Product.before_date(params[:dateEnd])
      else
        @product = @product.before_date(params[:dateEnd])
      end
    end

    ######### sort type
    if params[:sort_type] == 0
       if @product == nil
        @product = Product.newest_first()
      else
        @product = @product.newest_first()
      end
    elsif params[:sort_type] == 1
      if @product == nil
        @product = Product.oldest_first()
      else
        @product = @product.oldest_first()
      end
    elsif params[:sort_type] == 2
      if @product == nil
        @product = Product.lowest_price_first()
      else
        @product = @product.lowest_price_first()
      end
    elsif params[:sort_type] == 1
      if @product == nil
        @product = Product.highest_price_first()
      else
        @product = @product.highest_price_first()
      end
    else
      @product = Product.newest_first()
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
