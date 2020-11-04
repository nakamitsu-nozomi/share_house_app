class AddClipsCountToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :clips_count, :integer,default: 0
  end
end
