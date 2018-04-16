json.extract! order, :id, :user_id, :guess_id, :total_price, :status, :date_order, :date_receipt, :created_at, :updated_at
json.url order_url(order, format: :json)
