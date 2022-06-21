class RelationToDiscountItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :discount_items, :product, null: false, foreign_key: true
    add_reference :discount_items, :discount, null: false, foreign_key: true
  end
end
