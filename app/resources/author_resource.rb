class AuthorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :year_of_birth, :integer
  attribute :bio, :string
  attribute :image, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  has_many   :bibliography,
             resource: BookResource

  # Indirect associations

  has_many :best_writing, resource: BestLineResource do
    assign_each do |author, best_lines|
      best_lines.select do |b|
        b.id.in?(author.best_writing.map(&:id))
      end
    end
  end
end
