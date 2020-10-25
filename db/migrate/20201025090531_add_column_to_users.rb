class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :user_icon, :string
    add_column :users, :adress, :string
    add_column :users, :experience, :boolean, default: false, null: false
  end
end
