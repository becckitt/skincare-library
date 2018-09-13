class UpdateUserColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firebase_id, :integer

    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
    remove_column :users, :confirmed_at
    remove_column :users, :password_digest
  end
end