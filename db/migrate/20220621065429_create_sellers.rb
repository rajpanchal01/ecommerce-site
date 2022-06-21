class CreateSellers < ActiveRecord::Migration[6.1]
  def change
    create_table :sellers do |t|
      t.string :gst_id, :null => false
      t.string :pan_id,:null => false
      t.string :seller_location

      t.timestamps
    end
  end
end
