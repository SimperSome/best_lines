class Category < ApplicationRecord
  # Direct associations

  has_many   :best_lines,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
