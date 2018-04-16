json.extract! booking_detail, :id, :user_id, :booking_id, :dish_id, :price, :created_at, :updated_at
json.url booking_detail_url(booking_detail, format: :json)
