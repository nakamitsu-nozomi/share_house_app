class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true
      t.boolean :type, default: false, null: false
      t.integer :star
      t.string :title
      t.integer :clean_review
      t.integer :houserule_review
      t.integer :location_review
      t.integer :com_review

      t.timestamps
    end
  end
end
