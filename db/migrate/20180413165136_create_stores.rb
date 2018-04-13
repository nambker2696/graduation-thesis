class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :subdomain
      t.integer :user_id

      t.timestamps
    end
  end
end
