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
    @other_product = Product.search_category(@show_product.category_id).where("id != ?", @show_product.id)
  end

  def new
    if logged_in?
      @product = Product.new
    else
      flash[:danger] = "برای ثبت آگهی می بایست وارد حساب کاربری شوید."
      render 'sessions/new'
    end
  end

  def create
    if logged_in?
      @product = Product.new(product_params)   
      if @product.save
        flash[:success] = "آگهی مورد نظر ثبت گردید."
        redirect_to(:action=>'show', :id => @product.id)
      else
        flash[:success] = "خطا"
        render 'new'
      end
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
  end

  def edit
    if logged_in?
      @product = Product.find_by_id(params[:id])
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
    
  end

  def update
    if logged_in?
      @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        flash[:success] = "مشخصات امانتی با موفقیت ویرایش شد"
        redirect_to(:action=>'show', :id => params[:id])
      else
        flash[:danger] = "در ثبت اطلاعات خطایی رخ داد. لطفا دوباره تلاش کنید."
        redirect_to(:action=>'edit', :id => params[:id])
      end
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
    

  end

  def edit_choose
    if logged_in?
      @user_products = Product.where(user_id: params[:id])
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
  end

  def delete
    if logged_in?
      product = Product.find(params[:id]).destroy
      redirect_to(:action => 'edit_choose')
    else
      flash[:danger] = "لطفا وارد حساب کاربری خود شوید."
      render 'sessions/new'
    end
    
  end

  private
    def product_params
      params.require(:product).permit(:name, :category_id, :user_id, :description, :price, :city, :address, :phone_number,:email, nil, :photo, nil)
    end
end