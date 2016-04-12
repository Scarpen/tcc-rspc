json.array!(@interests) do |interest|
  json.extract! interest, :id, :name, :description
  json.url interest_url(interest, format: :json)
end
