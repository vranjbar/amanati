class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "name", :limit => 75
    	t.string "user_name", :default =>"", :null => false, :limit => 25, :unique => true
    	t.string "hashed_password", :default =>"", :null => false, :limit => 40
    	t.string "email", :default =>"", :null => false
    	t.string "province", :limit => 20
    	t.string "city", :limit => 20
    	t.string "address", :limit => 150
    	t.string "phone_number", :limit => 15
    	#filename
    	t.string "image", :limit => 100

    	#"created_at" and "updated_at"
        t.timestamps
    end

  end

  def down
  	drop_table :users
  end
end
