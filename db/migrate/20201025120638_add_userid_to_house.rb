class AddUseridToHouse < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :user_id, :integer
  end
end
