class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :authors

  has_many   :categories

  has_many   :readings,
             resource: BookResource

  has_many   :favorite_lines,
             resource: BestLineResource

  # Indirect associations

  many_to_many :books
end
