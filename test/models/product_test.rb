require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    def setup
    @user = users(:example_user)
    @product = @user.products.build(name: "book")
  end

  # test "should be valid" do
  #   assert @product.valid?
  # end

  test "user id should be present" do
    @product.user_id = nil
    assert_not @product.valid?
  end

  test "category id should be present" do
    @product.category_id = nil
    assert_not @product.valid?
  end

  test "name should be present " do
    @product.name = "   "
    assert_not @product.valid?
  end

  test "description should be present" do
    @product.description = " "
    assert_not @product.valid?
  end

   test "phone_number should be present" do
    @product.phone_number = nil
    assert_not @product.valid?
  end

  test "price should be present" do
    @product.price = nil
    assert_not @product.valid?
  end
end
