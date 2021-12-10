class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :favorite_lines,
             resource: BestLineResource

  has_many   :reading_list,
             resource: BookResource

  # Indirect associations
end
