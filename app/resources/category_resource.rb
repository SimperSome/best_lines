class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  has_many   :best_lines

  # Indirect associations

  many_to_many :books

  has_many :authors do
    assign_each do |category, authors|
      authors.select do |a|
        a.id.in?(category.authors.map(&:id))
      end
    end
  end

  filter :book_id, :integer do
    eq do |scope, value|
      scope.eager_load(:authors).where(best_lines: { book_id: value })
    end
  end
end
