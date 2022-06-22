class CreateUserOtps < ActiveRecord::Migration[6.1]
  def change
    create_table :user_otps do |t|
      t.integer :otp

      t.timestamps
    end
  end
end
