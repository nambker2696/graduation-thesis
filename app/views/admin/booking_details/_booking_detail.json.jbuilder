json.extract! booking_detail, :id, :created_at, :updated_at
json.url booking_detail_url(booking_detail, format: :json)
