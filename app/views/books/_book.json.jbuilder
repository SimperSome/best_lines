json.extract! book, :id, :name, :publishing_year, :author_id, :user_id, :cover,
              :created_at, :updated_at
json.url book_url(book, format: :json)
