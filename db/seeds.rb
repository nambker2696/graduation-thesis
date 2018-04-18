puts "Faker admin@gmail.com admin1"
User.create!(name:  "Admin",
 email: "admin@gmail.com",
 password:              "admin1",
 password_confirmation: "admin1",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: 100)
User.create!(name:  "NambKer",
 email: "nam@gmail.com",
 password:              "123456",
 password_confirmation: "123456",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: 0)

puts "Faker 15 Users(admin:0)"
15.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password:              "123456",
    password_confirmation: "123456",
    avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
    admin: 0
    )
end
puts "Faker 5 staff(admin:5)"
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password:              "123456",
    password_confirmation: "123456",
    avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
    admin: 5
    )
end


puts "Faker 10 Store"
users =  User.all
users.each do |user|
  Store.create(
    subdomain: Faker::Company.buzzword,
    user_id: user.id
    )
end

puts "Faker 10 Category"
10.times do
  name_cat = Faker::Name.name
  Category.create(
    name: name_cat,
    display_name: name_cat
    )
end

puts "Faker 10 Dish"
10.times do
 Dish.create(
  name: Faker::Food.dish, 
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

puts "Faker 10 Order"
10.times do
  Order.create(
    user_id: Faker::Number.between(1, 10),
    total_price: Faker::Number.decimal(2),
    status: Faker::Boolean.boolean,
    date_order: Faker::Date.between(2.days.ago, Date.today),
    date_receipt: Faker::Date.between(2.days.ago, Date.today)
    )
end

puts "Faker 10 Booking"
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
puts "Faker 10 Location"
stores = Store.all
stores.each do |store|
  Location.create(
    store_id: store.id,
    name: Faker::Name.name,
    address: Faker::Address.city,
    phone: Faker::PhoneNumber.cell_phone,
    status: true
    )
end
puts "Faker 7 OpeningHours for each location"
locats = Location.all
locats.each do |locat|
  i = 0
  7.times do
    i+=1
    OpeningHour.create(
      day: i,
      location_id: locat.id,
      open: Faker::Time.forward(23, :morning),
      close: Faker::Time.backward(14, :evening),
      status: true
      )
  end
end
