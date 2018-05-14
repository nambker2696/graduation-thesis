json.dishes do
  json.array!(@dishes) do |dish|
    json.name dish.name
    json.url location_dish_path(location_id: dish.location.id,id: dish.id)
  end
end