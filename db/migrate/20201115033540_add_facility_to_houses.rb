class AddFacilityToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :kitchen, :integer
    add_column :houses, :refrigerator, :integer
    add_column :houses, :laundry, :integer
    add_column :houses, :dryer, :integer
    add_column :houses, :toilet, :integer
    add_column :houses, :shower, :integer
    add_column :houses, :bathroom, :integer
  end
end
