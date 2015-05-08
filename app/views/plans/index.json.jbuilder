json.array!(@plans) do |plan|
  json.extract! plan, :id, :uni_id, :degree_id, :field_id, :semester_id, :min_toefl, :min_GRE, :deadline, :app_fee
  json.url plan_url(plan, format: :json)
end
