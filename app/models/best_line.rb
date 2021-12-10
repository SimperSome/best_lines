class BestLine < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :user,
             counter_cache: :favorite_lines_count

  belongs_to :book,
             counter_cache: true

  belongs_to :category,
             optional: true,
             counter_cache: true

  # Indirect associations

  has_one    :author,
             through: :book,
             source: :author

  # Validations

  validates :image, presence: true

  validates :page, presence: true

  # Scopes

  def to_s
    notes
  end
end
