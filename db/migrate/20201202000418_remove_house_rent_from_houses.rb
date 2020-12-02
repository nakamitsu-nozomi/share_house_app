class RemoveHouseRentFromHouses < ActiveRecord::Migration[6.0]
  def change
    remove_column :houses, :house_rent, :integer
  end
end
