class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :year_of_birth
      t.text :bio
      t.string :image

      t.timestamps
    end
  end
end
