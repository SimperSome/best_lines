class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string
  attribute :user_id, :integer

  # Direct associations

  has_many :best_lines

  # Indirect associations
end
