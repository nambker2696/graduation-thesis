class AddCityRefToDistricts < ActiveRecord::Migration[5.1]
  def change
    add_reference :districts, :city, foreign_key: true
  end
end
