json.array!(@builds) do |build|
  json.extract! build, :id, :repository_id, :state
  json.url build_url(build, format: :json)
end
