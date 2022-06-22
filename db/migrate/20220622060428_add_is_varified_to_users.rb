class AddIsVarifiedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_varified, :integer, :null => false, :default => 0
  end
end
