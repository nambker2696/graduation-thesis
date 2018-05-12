class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :slug_dish
      t.string :subtitle
      t.decimal :price
      t.text :description
      t.integer :portion
      t.integer :serves
      t.integer :min_qty
      t.string :tags
      t.string :image, default: ""
      t.boolean :active
      
      t.timestamps
    end
  end
end
