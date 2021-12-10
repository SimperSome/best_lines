class AddFavoriteLineCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favorite_lines_count, :integer
  end
end
