puts "Faker 50 Users"
User.create!(name:  "Admin",
 email: "admin@gmail.com",
 password:              "admin1",
 password_confirmation: "admin1",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: true)
User.create!(name:  "Example User",
 email: "nam@gmail.com",
 password:              "123456",
 password_confirmation: "123456",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: false)

10.times do
Store.create(
  subdomain: Faker::Company.buzzword,
  user_id: Faker::Number.between(1, 10)
  )
end

10.times do
 Dish.create(
  name: Faker::Name.name , 
  display_name: Faker::Name.name, 
  subtitle: "This is a perfect example of a blog post.  
  Feel free to reference of this blog post.",
  price: "125.6",
  description: "This is a perfect example of a blog post.  
  Feel free to reference of this blog post.",
  category_id: Faker::Number.between(1, 10),
  tags: "fish"
  )
end

10.times do
Order.create(
  user_id: Faker::Number.between(1, 10),
  total_price: Faker::Number.decimal(2),
  status: Faker::Boolean.boolean,
  date_order: Faker::Date.between(2.days.ago, Date.today),
  date_receipt: Faker::Date.between(2.days.ago, Date.today)
  )
end

10.times do
Booking.create(
  user_id: Faker::Number.between(1, 10),
  place: Faker::Address.street_address,
  status: Faker::Boolean.boolean,
  date_booked: Faker::Date.between(2.days.ago, Date.today),
  date_receipt: Faker::Date.between(2.days.ago, Date.today),
  action: Faker::Number.between(1, 3)
  )
end