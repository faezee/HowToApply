json.array!(@notifications) do |notification|
  json.extract! notification, :id, :user_id, :event_type, :event_id, :content
  json.url notification_url(notification, format: :json)
end
