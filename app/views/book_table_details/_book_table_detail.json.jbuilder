json.extract! book_table_detail, :id, :user_id, :book_table_id, :dish_id, :price, :created_at, :updated_at
json.url book_table_detail_url(book_table_detail, format: :json)
