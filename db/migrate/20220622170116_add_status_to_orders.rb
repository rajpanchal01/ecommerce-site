class AddStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :status, :string, :null => false, :default => "created"
  end
end
