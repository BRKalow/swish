json.array!(@collections) do |collection|
  json.extract! collection, :id, :name, :user_id, :num_snippets, :num_likes
  json.url collection_url(collection, format: :json)
end
