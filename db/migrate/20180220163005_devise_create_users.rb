# frozen_string_literal: true

# :nodoc: comment
class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :provider
      t.string :uid
      t.integer :admin
      # t.string :avatar, default: 'ava-default-male.jpg'
      t.string :avatar
      t.integer :point_level, default: 0

      t.date :birthday
      t.integer :sex
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :type_chef
      t.string :phone
      
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
