class Book < ApplicationRecord
  # Direct associations

  has_many   :best_lines,
             dependent: :destroy

  belongs_to :author,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
