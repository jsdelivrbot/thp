json.extract! email, :id, :object, :body, :read, :created_at, :updated_at
json.url email_url(email, format: :json)
