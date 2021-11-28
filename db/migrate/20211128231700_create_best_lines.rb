class CreateBestLines < ActiveRecord::Migration[6.0]
  def change
    create_table :best_lines do |t|
      t.string :image
      t.integer :book_id
      t.integer :page
      t.text :notes
      t.integer :category_id

      t.timestamps
    end
  end
end
