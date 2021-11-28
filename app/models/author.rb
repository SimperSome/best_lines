class Author < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :books,
             dependent: :destroy

  # Indirect associations

  has_many   :best_lines,
             through: :books,
             source: :best_lines

  # Validations

  # Scopes

  def to_s
    name
  end
end
