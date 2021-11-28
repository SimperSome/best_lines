json.extract! author, :id, :name, :dob, :bio, :image, :created_at, :updated_at
json.url author_url(author, format: :json)
