class BestLine < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :book,
             :counter_cache => true

  belongs_to :category,
             :counter_cache => true

  # Indirect associations

  has_one    :author,
             :through => :book,
             :source => :author

  # Validations

  validates :page, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
