class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.integer :location_id
      t.string :name
      t.string :start
      t.string :end

      t.timestamps
    end
  end
end
