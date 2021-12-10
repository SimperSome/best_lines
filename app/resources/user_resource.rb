class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :authors

  has_many   :favorite_lines,
             resource: BestLineResource

  has_many   :reading_list,
             resource: BookResource

  has_many   :choices,
             resource: CategoryResource

  # Indirect associations
end
