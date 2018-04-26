class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.boolean :status
      t.string :radius
      
      t.timestamps
    end
  end
end
