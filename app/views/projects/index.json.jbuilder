json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :avatar, :date_time_start, :date_time_end, :place
  json.url project_url(project, format: :json)
end
