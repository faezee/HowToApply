json.array!(@profiles) do |profile|
  json.extract! profile, :id, :age, :universityName, :previews, :currentUni, :phoneNumber, :name, :familyName
  json.url profile_url(profile, format: :json)
end
