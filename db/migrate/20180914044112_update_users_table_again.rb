class UpdateUsersTableAgain < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :firebase_id, :string
    remove_column :users, :encrypted_password
  end
end
