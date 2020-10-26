class RemoveUseridFromHouse < ActiveRecord::Migration[6.0]
  def change
    remove_column :houses, :user_id, :integer
  end
end
