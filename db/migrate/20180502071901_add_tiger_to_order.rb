class AddTigerToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tiger, :boolean, default: false
  end
end
