class RemovefacilityToFacility < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :facility, :integer
    add_column :facilities, :name, :string
  end
end
