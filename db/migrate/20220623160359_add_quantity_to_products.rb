class AddQuantityToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :quantity, :integer, :null => false, :default => 50
  end
end
