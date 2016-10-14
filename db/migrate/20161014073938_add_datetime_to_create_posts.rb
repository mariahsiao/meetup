class AddDatetimeToCreatePosts < ActiveRecord::Migration
  def change
    add_column :posts, :date, :timestamp
  end
end
