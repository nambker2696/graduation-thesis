class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :display_name
      t.integer :sub_category

      t.timestamps
    end
  end
end
