class RemoveRoomnumberFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :room_number, :integer
    add_column :rooms, :room_num, :string
  end
end
