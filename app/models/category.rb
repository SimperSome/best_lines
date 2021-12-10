class Category < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :best_lines

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
