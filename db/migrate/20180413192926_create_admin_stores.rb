class CreateAdminStores < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_stores do |t|

      t.timestamps
    end
  end
end
