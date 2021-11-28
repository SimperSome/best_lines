class BestLine < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :page, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
