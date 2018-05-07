class AddLocationRefToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :location, foreign_key: true
  end
end
