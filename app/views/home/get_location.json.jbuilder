json.locations do
  json.array!(@locations) do |location|
    json.name location.address
    json.url location_path(location)
  end
end