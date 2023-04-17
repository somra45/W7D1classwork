class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :create_users, :users
    add_column :users, :session_token, :string, null: false, index: true, unique: true
  end
end
