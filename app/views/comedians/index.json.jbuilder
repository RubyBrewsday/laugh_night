json.array!(@comedians) do |comedian|
  json.extract! comedian, :id, :name, :website
  json.url comedian_url(comedian, format: :json)
end
