class AddCategoryReferenceToBestLines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :best_lines, :categories
    add_index :best_lines, :category_id
  end
end
