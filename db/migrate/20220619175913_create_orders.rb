class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :total_amount

      t.timestamps
    end
  end
end
