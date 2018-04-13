class CreateBookTableDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :book_table_details do |t|
      t.integer :user_id
      t.integer :book_table_id
      t.integer :dish_id
      t.float :price

      t.timestamps
    end
  end
end
