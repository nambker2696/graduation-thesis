ActiveRecord::Schema.define(version: '20180220163005') do
  create_table 'user', force: :cascade do |t|
    t.string 'name', default: :null, null: false
    t.string 'email', default: :null, null: false
    t.string 'encrypted_password', default: :null, null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name:
    'index_users_on_reset_password_token', unique: true
  end
end
