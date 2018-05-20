class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :open_time
      t.text :description
      t.float :radius
      t.boolean :status
      t.integer :max_table
      t.integer :sum_rate
      t.date :delivery_time
      t.decimal :min_booking
      t.decimal :min_order
      t.float :rate_avg
      t.boolean :status_booking
      t.boolean :status_order
      
      t.timestamps
    end
  end
end
