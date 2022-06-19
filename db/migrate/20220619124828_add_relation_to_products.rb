class AddRelationToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :sub_category, foreign_key: true
    add_reference :products, :brand, foreign_key: true
  end
end
