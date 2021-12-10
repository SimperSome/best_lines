class Category < ApplicationRecord
  # Direct associations

  has_many   :best_lines,
             dependent: :destroy

  # Indirect associations

  has_many   :users,
             through: :best_lines,
             source: :user

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
