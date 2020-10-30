json.extract! post, :id, :titulo, :user_id, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
