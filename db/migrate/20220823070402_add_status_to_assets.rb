class AddStatusToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :status, :string
  end
end
