class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :house_image
      t.integer :house_rent
      t.integer :service_fee
      t.string :station
      t.integer :access
      t.integer :house_size
      t.text :convenience
      t.text :content

      t.timestamps
    end
  end
end
