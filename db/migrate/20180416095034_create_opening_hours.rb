class CreateOpeningHours < ActiveRecord::Migration[5.1]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.integer :location_id
      t.time :open
      t.time :close
      t.boolean :status

      t.timestamps
    end
  end
end
