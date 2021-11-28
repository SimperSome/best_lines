class BookResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :publishing_year, :integer
  attribute :author_id, :integer

  # Direct associations

  belongs_to :author

  # Indirect associations

end
