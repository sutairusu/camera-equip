class ChangeDataTypeForPriceToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :equipment, :price, :integer
  end
end
