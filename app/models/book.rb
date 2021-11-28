class Book < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
