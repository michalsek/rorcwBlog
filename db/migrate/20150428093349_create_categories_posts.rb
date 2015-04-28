class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts do |t|
      t.integer :category_id
      t.integer :post_id

      t.timestamps
    end
    add_index :categories_posts, [:category_id, :post_id]
  end
end
