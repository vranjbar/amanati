class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
    	t.string "name", :limit => 100, :default =>"", :null => false, :unique => true

    	#"created_at" and "updated_at"
        t.timestamps
    end
  end

  def down
  	drop_table :categories
  end
end
