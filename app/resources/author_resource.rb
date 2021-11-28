class AuthorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :dob, :date
  attribute :bio, :string
  attribute :image, :string

  # Direct associations

  has_many :books

  # Indirect associations

  has_many :best_lines do
    assign_each do |author, best_lines|
      best_lines.select do |b|
        b.id.in?(author.best_lines.map(&:id))
      end
    end
  end
end
