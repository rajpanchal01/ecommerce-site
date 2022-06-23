class AddRelationToWishlistItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :wishlist_items, :wishlist, null: false, foreign_key: true
    add_reference :wishlist_items, :product, null: false, foreign_key: true
  end
end
