class CreateHousesFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :houses_facilities do |t|
      t.references :house, index: true, foreign_key: true
      t.references :facility, index: true, foreign_key: true
      t.timestamps
    end
  end
end
