class CreateCameras < ActiveRecord::Migration[7.0]
  def change
    create_table :cameras do |t|
      t.references :user, null: false, foreign_key: true
      t.string :model
      t.string :brand
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
