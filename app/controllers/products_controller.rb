class ProductsController < ApplicationController
  layout "main_layout"
  $myCity =  ['انتخاب شهر','تهران','اراک', 'اردبیل', 'اصفهان', 'اهواز', 'ایلام', 'بجنورد', 'بندرعباس', 'بوشهر', 'بیرجند', 'ارومیه', 'تبریز', 'خرم آباد', 'رشت', 'زاهدان', 'زنجان', 'ساری', 'سمنان', 'سنندج', 'شهرکرد', 'شیراز', 'قزوین', 'قم', 'کرج', 'کرمان', 'کرمانشاه', 'گرگان', 'مشهد', 'همدان', 'یاسوج', 'یزد']
  
  def search   
  #initializi
    @product = nil
    @searched = false

    if params[:title] != nil && params[:title] != ""
      @product = Product.search_name(params[:title])
      @searched = true
    end

    if params[:category_id] != nil && params[:category_id] != "0"
      @searched = true
      if @product == nil || @product.any? == false
        @product = Product.search_category(params[:category_id])
      else
        @product = @product.search_category(params[:category_id])
      end
    end

    if params[:city_id] != nil && params[:city_id] != "انتخاب شهر"
      @searched = true
      if @product == nil || @product.any? == false
        @product = Product.search_city(params[:city_id])
      else
        @product = @product.search_city(params[:city_id])
      end
    end

    if params[:priceStart] !=nil && params[:priceStart] != ""
      @searched = true
      if @product == nil || @product.any? == false
        @product = Product.over_price(params[:priceStart])
      else
        @product = @product.over_price(params[:priceStart])
      end
    end

    if params[:priceEnd] != nil && params[:priceEnd] != ""
      @searched = true
      if @product == nil || @product.any? == false
        @product = Product.under_price(params[:priceEnd])
      else
        @product = @product.under_price(params[:priceEnd])
      end
    end

    if params[:dateStart] != nil && params[:dateStart] != ""
      @searched = true
      if @product == nil || @product.any? == false
        @product = Product.after_date(params[:dateStart])
      else
        @product = @product.after_date(params[:dateStart])
      end
    end

    if params[:dateEnd] != nil && params[:dateEnd] != ""
      @searched = true
      if @product == nil || @product.any? == false
        @product = Product.before_date(params[:dateEnd])
      else
        @product = @product.before_date(params[:dateEnd])
      end
    end

    ######### sort type
    if params[:sort_type] == "0"
      if @product == nil || @product.any? == false
        if @searched == false
          @product = Product.newest_first()
        end
      else
        @product = @product.newest_first()
      end
    elsif params[:sort_type] == "1"
      if @product == nil || @product.any? == false
        if @searched == false
          @product = Product.oldest_first()
        end
      else
        @product = @product.oldest_first()
      end
    elsif params[:sort_type] == "2"
      if @product == nil || @product.any? == false
        if @searched == false
          @product = Product.lowest_price_first()
        end
      else
        @product = @product.lowest_price_first()
      end
    elsif params[:sort_type] == "3"
      if @product == nil || @product.any? == false
        if @searched == false
          @product = Product.highest_price_first()
        end
      else
        @product = @product.highest_price_first()
      end
    end

    if @searched == false && @product == nil
      @product = Product.newest_first()
    end
  end

  def show
    @show_product = Product.find(params[:id])
    @other_product = Product.search_category(@show_product.category_id)
  end

  def new
    if logged_in?
      @product = Product.new
    else
      flash[:error] = "برای ثبت آگهی می بایست وارد حساب کاربری شوید.."
      render 'sessions/new'
    end
  end

  def create
    @product = Product.new(product_params)   
      if @product.save
        flash[:success] = "آگهی مورد نظر ثبت گردید."
        redirect_to(:action=>'show', :id => @product.id)
      else
        flash[:success] = "خطا"
        render 'new'
      end
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def edit_choose
    @user_products = Product.where(user_id: params[:id])
  end

  def delete
    product = Product.find(params[:id]).destroy
    redirect_to(:action => 'edit_choose')
  end

  private
    def product_params
      params.require(:product).permit(:name, :category_id, :user_id, :description, :price, :city, :address, :phone_number,:email, nil, :image, nil)
    end
end