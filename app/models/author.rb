class Author < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :bibliography,
             class_name: "Book",
             dependent: :destroy

  # Indirect associations

  has_many   :best_writing,
             through: :bibliography,
             source: :best_lines

  # Validations

  # Scopes

  def to_s
    name
  end
end
