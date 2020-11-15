class AddIconToFacility < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :icon, :string
  end
end
