json.extract! quiz, :id, :title, :description, :published, :category_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)