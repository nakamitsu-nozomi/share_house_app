class RemoveRppmTypeToRomms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :rppm_type, :boolean
    add_column :rooms, :room_type, :boolean, default: false, null: false
  end
end
