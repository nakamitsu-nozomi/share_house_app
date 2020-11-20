class RemoveroomtypeFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :room_type, :boolean
    add_column :rooms, :room_type, :integer,null: false
    remove_column :rooms, :vacancy, :boolean
    add_column :rooms, :vacancy, :integer,null: false
  end
end
