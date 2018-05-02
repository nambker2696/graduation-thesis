class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :display_name
      t.string :subtitle
      t.decimal :price
      t.text :description
      t.string :tags
      t.string :image, default: ""
      t.boolean :active
      
      t.timestamps
    end
  end
end
