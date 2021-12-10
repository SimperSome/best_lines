json.extract! author, :id, :name, :year_of_birth, :bio, :image, :created_at,
              :updated_at
json.url author_url(author, format: :json)
