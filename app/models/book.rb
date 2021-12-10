class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader

  # Direct associations

  belongs_to :user,
             optional: true

  has_many   :best_lines,
             dependent: :destroy

  belongs_to :author,
             counter_cache: :bibliography_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
