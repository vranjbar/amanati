class RenamePasswordColumn < ActiveRecord::Migration
  def up
    add_column :users, :password_digest, :string
  end

  def down
    # rename back if you need or do something else or do nothing
  end
end