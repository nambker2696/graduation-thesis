class AddLocationRefToDishes < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :location, foreign_key: true
  end
end
