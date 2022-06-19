class CreateMainCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :main_categories do |t|
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
