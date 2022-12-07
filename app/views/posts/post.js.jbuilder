json.set! :posts do
  json.array! @posts do |post|
    json.id post.id
    json.text post.text
    json.user_id post.user_id
    json.created_at post.created_at
    json.updated_at post.updated_at
    json.image url_for(post.image)
  end
end
