class FillCategoryData < ActiveRecord::Migration
  def change
  	Category.create([{ :name => 'کتاب' }])
  	Category.create([{ :name => 'تفریحی' }])
  	Category.create([{ :name => 'لوازم شخصی' }])
  	Category.create([{ :name => 'لوازم الکترونیکی' }])
  	Category.create([{ :name => 'لوزام خانگی' }])
  	Category.create([{ :name => 'املاک' }])
  	Category.create([{ :name => 'خودرو' }])
  end
end
