class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.integer :price

      t.timestamps
    end
  end
end
