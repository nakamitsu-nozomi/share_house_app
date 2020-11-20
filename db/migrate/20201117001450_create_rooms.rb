class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number,null: false
      t.string :image
      t.integer :size,null: false
      t.integer :rent,null: false
      t.boolean :rppm_type,default: false, null: false
      t.boolean :vacancy,default: false, null: false
      t.references :house, null: false, foreign_key: true
      t.timestamps
    end
  end
end
