class ChangeDescriptionColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :cameras, :description, :text
  end
end
