class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :message
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
