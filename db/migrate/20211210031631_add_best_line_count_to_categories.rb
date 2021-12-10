class AddBestLineCountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :best_lines_count, :integer
  end
end
