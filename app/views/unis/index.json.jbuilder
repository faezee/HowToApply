json.array!(@unis) do |uni|
  json.extract! uni, :id, :name
  json.url uni_url(uni, format: :json)
end
