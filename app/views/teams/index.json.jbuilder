json.array!(@teams) do |team|
  json.extract! team, :id, :name, :picture
  json.url team_url(team, format: :json)
end
