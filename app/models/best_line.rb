class BestLine < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :page, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
