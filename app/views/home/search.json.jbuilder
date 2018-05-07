json.dishes do
  json.array!(@dishes) do |dish|
    json.name dish.name
    json.url location_dish_path(location_id: dish.location.id,id: dish.id)
  end
end

json.locations do
  json.array!(@locations) do |location|
    json.name location.name
    json.url location_path(location)
  end
end
