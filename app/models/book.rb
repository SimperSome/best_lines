class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader

  # Direct associations

  has_many   :best_lines,
             dependent: :destroy

  belongs_to :author,
             counter_cache: :bibliography_count

  # Indirect associations

  has_many   :tastes,
             through: :best_lines,
             source: :user

  # Validations

  # Scopes

  def to_s
    name
  end
end
