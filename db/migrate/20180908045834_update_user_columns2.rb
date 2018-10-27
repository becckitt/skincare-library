class UpdateUserColumns2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
    remove_column :users, :confirmation_token
    remove_column :users, :confirmation_sent_at
  end
end
