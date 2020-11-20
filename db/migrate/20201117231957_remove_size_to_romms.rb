class RemoveSizeToRomms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :size, :integer
    add_column :rooms, :size, :float,null: false
  end
end
