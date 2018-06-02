class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string :writer
      t.text :content
      t.belongs_to :post
      t.belongs_to :user
      
      t.timestamps null: false
    end
  end
end
