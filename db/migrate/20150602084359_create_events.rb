class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
