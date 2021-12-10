class AddBestLineCountToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :best_lines_count, :integer
  end
end
