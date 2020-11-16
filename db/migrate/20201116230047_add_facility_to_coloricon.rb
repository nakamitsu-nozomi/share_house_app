class AddFacilityToColoricon < ActiveRecord::Migration[6.0]
  def change
   add_column :facilities, :color_icon, :string
  end
end
