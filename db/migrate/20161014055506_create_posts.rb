class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.text :location

      t.timestamps null: false
    end
  end
end
