class AddFieldsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :buyer_id, :integer
    add_column :orders, :seller_id, :integer , default: 2
  end
end
