class RemoveQuantityFromAssets < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :quantity, :integer
  end
end
