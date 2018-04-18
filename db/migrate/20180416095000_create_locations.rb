class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :store_id
      t.string :name
      t.string :address
      t.string :phone
      t.boolean :status
      
      t.timestamps
    end
  end
end
