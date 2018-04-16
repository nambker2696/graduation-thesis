json.extract! booking, :id, :user_id, :guess_id, :place, :status, :date_booked, :date_receipt, :action, :created_at, :updated_at
json.url booking_url(booking, format: :json)
