json.extract! best_line, :id, :image, :book_id, :page, :notes, :category_id,
              :created_at, :updated_at
json.url best_line_url(best_line, format: :json)
