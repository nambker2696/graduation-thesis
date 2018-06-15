class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :status
      t.integer :action
      t.integer :location_id
      t.string :delivery_type
      t.string :payment_type
      t.date :date_receipt

      t.timestamps
    end
  end
end
