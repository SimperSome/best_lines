class AddBibliographyCountToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :bibliography_count, :integer
  end
end
