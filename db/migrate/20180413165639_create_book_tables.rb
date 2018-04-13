class CreateBookTables < ActiveRecord::Migration[5.1]
  def change
    create_table :book_tables do |t|
      t.integer :user_id
      t.integer :guess_id
      t.float :total_price
      t.boolean :status
      t.date :date_order
      t.date :date_receipt

      t.timestamps
    end
  end
end
