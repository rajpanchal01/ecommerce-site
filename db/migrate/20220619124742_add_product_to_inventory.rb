class AddProductToInventory < ActiveRecord::Migration[6.1]
  def change
    add_reference :inventories, :product, foreign_key: true
  end
end
