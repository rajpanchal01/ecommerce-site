class AddFullNameToUserAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :user_addresses, :full_name,:string
  end
end
