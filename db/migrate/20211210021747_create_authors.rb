class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :dob
      t.text :bio
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
