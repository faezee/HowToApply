json.array!(@professers) do |professer|
  json.extract! professer, :id, :name, :uni_id
  json.url professer_url(professer, format: :json)
end
