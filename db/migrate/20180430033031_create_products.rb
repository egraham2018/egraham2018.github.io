class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 4, scale: 2
      t.string :category
      t.string :image
      t.integer :stock

      t.timestamps
    end
  end
end
