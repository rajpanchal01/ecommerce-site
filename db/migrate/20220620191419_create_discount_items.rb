class CreateDiscountItems < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_items do |t|

      t.timestamps
    end
  end
end
