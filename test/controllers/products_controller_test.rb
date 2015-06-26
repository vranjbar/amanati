require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup
    @product = products(:sample_product)
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get show" do
    get :show, id: @product 
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product 
    assert_response :success
  end

end
