class ConvertCommentsToPolymorphic < ActiveRecord::Migration
  def change
    remove_column :comments, :post_id
    add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
