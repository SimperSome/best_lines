class BestLineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image, :string
  attribute :book_id, :integer
  attribute :page, :integer
  attribute :notes, :string
  attribute :category_id, :integer

  # Direct associations

  belongs_to :book

  belongs_to :category

  # Indirect associations

end
