json.array!(@semesters) do |semester|
  json.extract! semester, :id, :semester_date
  json.url semester_url(semester, format: :json)
end
