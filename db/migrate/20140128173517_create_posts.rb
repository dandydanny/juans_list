class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :contact
      t.integer :category_id
      t.timestamps
    end
  end
end
