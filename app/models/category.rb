class Category < ApplicationRecord
  enum category_name: { "justgood" => 0, "romantic" => 1, "inspirational" => 2 }

  # Direct associations

  belongs_to :user

  has_many   :best_lines,
             dependent: :destroy

  # Indirect associations

  has_many   :books,
             through: :best_lines,
             source: :book

  has_many   :authors,
             through: :best_lines,
             source: :author

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
