class AuthorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :dob, :date
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

  has_many :categories do
    assign_each do |author, categories|
      categories.select do |c|
        c.id.in?(author.categories.map(&:id))
      end
    end
  end

  filter :category_id, :integer do
    eq do |scope, value|
      scope.eager_load(:categories).where(best_lines: { category_id: value })
    end
  end
end
