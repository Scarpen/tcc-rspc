json.array!(@abilities) do |ability|
  json.extract! ability, :id, :name, :description
  json.url ability_url(ability, format: :json)
end
