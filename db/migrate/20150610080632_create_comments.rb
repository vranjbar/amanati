class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.integer "user_id"
    	t.integer "product_id"
    	t.text "description"
    	#"created_at" and "updated_at"
        t.timestamps
    end

    add_index("comments", "user_id")
    add_index("comments", "product_id")


  end

  def down
  	drop_table :comments
  end
end
