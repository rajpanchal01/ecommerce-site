class AddUserToUserOtps < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_otps, :user, null: false, foreign_key: true
  end
end
