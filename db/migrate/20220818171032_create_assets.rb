class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :user_id
      t.string :category
      t.string :description
      t.timestamps
    end
  end
end
