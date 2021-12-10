class BookResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :publishing_year, :integer
  attribute :author_id, :integer
  attribute :cover, :string

  # Direct associations

  has_many   :best_lines

  belongs_to :author

  # Indirect associations

  many_to_many :readers,
               resource: UserResource
end
