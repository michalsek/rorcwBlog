class AddAdultsOnlyToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :adults_only, :boolean
  end
end
