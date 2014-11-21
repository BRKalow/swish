json.array!(@favorite_snippets) do |favorite_snippet|
  json.extract! favorite_snippet, :id, :user_id, :snippet_id
  json.url favorite_snippet_url(favorite_snippet, format: :json)
end
