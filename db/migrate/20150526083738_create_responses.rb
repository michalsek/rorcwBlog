class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
