json.array!(@app_infos) do |app_info|
  json.extract! app_info, :id, :plan_id, :profile_id, :acc_or_rej, :professer_id
  json.url app_info_url(app_info, format: :json)
end
