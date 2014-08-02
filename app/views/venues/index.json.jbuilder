json.array!(@venues) do |venue|
  json.extract! venue, :id, :location, :drink_min, :ticket_price
  json.url venue_url(venue, format: :json)
end
