class AddCategoryToSubCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :sub_categories, :main_category, foreign_key: true
  end
end
