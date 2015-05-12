json.array!(@page_follows) do |page_follow|
  json.extract! page_follow, :id, :folowee_type, :folowee_id, :folower_type, :folower_id
  json.url page_follow_url(page_follow, format: :json)
end
