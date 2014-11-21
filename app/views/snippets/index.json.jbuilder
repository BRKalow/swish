json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :language, :title, :body, :num_favorites, :num_views, :num_comments
  json.url snippet_url(snippet, format: :json)
end
