json.array!(@shows) do |show|
  json.extract! show, :id, :showtime
  json.url show_url(show, format: :json)
end
