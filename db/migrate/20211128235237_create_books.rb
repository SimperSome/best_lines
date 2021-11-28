class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :publishing_year
      t.integer :author_id
      t.integer :user_id

      t.timestamps
    end
  end
end
