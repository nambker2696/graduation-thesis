json.extract! dish, :id, :name, :display_name, :subtitle, :price, :description, :category_id, :tags, :created_at, :updated_at
json.url dish_url(dish, format: :json)
