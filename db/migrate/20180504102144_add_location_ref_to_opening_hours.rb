class AddLocationRefToOpeningHours < ActiveRecord::Migration[5.1]
  def change
    add_reference :opening_hours, :location, foreign_key: true
  end
end
