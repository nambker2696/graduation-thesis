class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :subdomain
      t.integer :user_id

      t.timestamps
    end
    add_index :stores, :user_id, unique: true
  end
end
