class AddUserToUserAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_addresses, :user, null: false, foreign_key: true
  end
end
