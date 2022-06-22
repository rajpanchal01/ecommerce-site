class AddSellerToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :seller, foreign_key: true
  end
end
