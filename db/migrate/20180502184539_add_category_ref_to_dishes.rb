class AddCategoryRefToDishes < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :category, foreign_key: true
  end
end
