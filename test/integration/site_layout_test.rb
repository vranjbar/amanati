require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'main_layout'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", "/products/new"
    assert_select "a[href=?]", "/products/search"
    assert_select "a[href=?]", "/main_pages/about"
    assert_select "a[href=?]", "/main_pages/contact"
  end
end