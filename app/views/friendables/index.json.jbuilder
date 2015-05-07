json.array!(@friendables) do |friendable|
  json.extract! friendable, :id, :from_id, :to_id, :accepted
  json.url friendable_url(friendable, format: :json)
end
