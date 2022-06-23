class AddStatusToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :status, :string, :null => false, :default => "created"
  end
end
