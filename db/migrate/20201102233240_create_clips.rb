class CreateClips < ActiveRecord::Migration[6.0]
  def change
    create_table :clips do |t|
      t.references :user, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  add_index :clips,[:user_id,:house_id],unique: true
  end
end
