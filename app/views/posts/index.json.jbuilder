json.array!(@posts) do |post|
  json.extract! post, :id, :content, :metadata
  json.url post_url(post, format: :json)
end
