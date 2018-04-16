json.extract! location, :id, :store_id, :name, :address, :phone, :created_at, :updated_at
json.url location_url(location, format: :json)
