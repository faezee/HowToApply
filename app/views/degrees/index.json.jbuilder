json.array!(@degrees) do |degree|
  json.extract! degree, :id, :name
  json.url degree_url(degree, format: :json)
end
