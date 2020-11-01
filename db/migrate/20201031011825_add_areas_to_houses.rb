class AddAreasToHouses < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :area, foreign_key: true
  end
end
