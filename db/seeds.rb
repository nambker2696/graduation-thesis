
puts "Faker admin@gmail.com admin1"
puts "Faker 15 Users(admin:0)"
puts "Faker 5 staff(admin:5)"
User.create!(name:  "Admin",
 email: "admin@gmail.com",
 password:              "admin1",
 password_confirmation: "admin1",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: 100)
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


puts "Faker 23 Category for 1 Store"

namae_cat = "Non-Veg" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Vegetarian" Category.create(name: namae_cat,display_name: namae_cat.parameterize)

namae_cat = "Northern VietNam" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "South VietNam" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Central Vietnam" Category.create(name: namae_cat,display_name: namae_cat.parameterize)

namae_cat = "Desserts" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Tea & Snacks" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Cakes" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Pickles" Category.create(name: namae_cat,display_name: namae_cat.parameterize)

namae_cat = "Bottled water" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Soft drink" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Soda" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Water" Category.create(name: namae_cat,display_name: namae_cat.parameterize)

namae_cat = "Party Food" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Party Birthday" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Party Wedding" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Family party" Category.create(name: namae_cat,display_name: namae_cat.parameterize)

namae_cat = "Healthy" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Traditional" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "International" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Fastfood" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Hotpot" Category.create(name: namae_cat,display_name: namae_cat.parameterize)
namae_cat = "Buffet" Category.create(name: namae_cat,display_name: namae_cat.parameterize)





puts "Faker 2 Location for Store"
20.times do
  Locations.create(
    name: Faker::Name.name,
    address: Faker::Address.city,
    phone: Faker::PhoneNumber.cell_phone,
    status: Faker::Boolean.boolean(0.2)
    )    
end

puts "Faker 100 Dish"
100.times do
  Dish.create(
    name: Faker::Food.dish, 
    display_name: Faker::Name.name, 
    subtitle: Faker::Food.measurement,
    price: Faker::Number.decimal(2),
    description: Faker::Food.ingredient,
    category_id: Faker::Number.between(1, 23)
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

User.create!(name:  "NambKer",
 email: "nam@gmail.com",
 password:              "123456",
 password_confirmation: "123456",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: 0)
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