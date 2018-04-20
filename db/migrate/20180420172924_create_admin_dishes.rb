class CreateAdminDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_dishes do |t|

      t.timestamps
    end
  end
end
