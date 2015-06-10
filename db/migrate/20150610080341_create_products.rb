class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
    	t.string "name", :limit => 75
    	t.integer "category_id"
    	t.integer "user_id"
    	t.text "description"
    	t.integer "price", :default =>"", :null => false
    	t.string "city", :limit => 20
    	t.string "address", :limit => 150
    	t.string "phone_number", :limit => 15
    	t.string "email", :default =>"", :null => false

    	#number of stars
    	t.integer "rank"
    	#filename of images seperated by /
    	t.string "image"

    	#"created_at" and "updated_at"
        t.timestamps
    end

    add_index("products", "category_id")
    add_index("products", "user_id")


  end

  def down
  	drop_table :products
  end
end
