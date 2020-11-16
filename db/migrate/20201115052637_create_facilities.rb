class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.integer :facility,default: 0
      t.timestamps
    end
  end
end
