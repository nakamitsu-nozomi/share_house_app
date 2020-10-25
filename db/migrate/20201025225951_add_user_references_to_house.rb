class AddUserReferencesToHouse < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :user, null: false, foreign_key: true
  end
end
