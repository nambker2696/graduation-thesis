json.extract! book_table, :id, :user_id, :guess_id, :total_price, :status, :date_order, :date_receipt, :created_at, :updated_at
json.url book_table_url(book_table, format: :json)
