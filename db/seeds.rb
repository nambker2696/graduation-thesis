
puts "Faker admin@gmail.com admin1"
puts "Faker 15 Users(admin:0)"
puts "Faker 5 staff(admin:5)"
User.create!(name:  "Admin",
 email: "admin@gmail.com",
 password:              "admin1",
 password_confirmation: "admin1",
 avatar: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
 admin: 100)

puts "Faker 23 Category for 1 Store"

namae_cat = "Northern VietNam" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 1)
namae_cat = "South VietNam" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 1)
namae_cat = "Central Vietnam" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 1)


namae_cat = "Party Food" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 2)
namae_cat = "Party Birthday" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 2)
namae_cat = "Party Wedding" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 2)
namae_cat = "Family party" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 2)


namae_cat = "Non-Veg" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 3)
namae_cat = "Vegetarian" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 3)


namae_cat = "Healthy" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 4)
namae_cat = "Traditional" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 4)
namae_cat = "International" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 4)
namae_cat = "Fastfood" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 4)
namae_cat = "Hotpot" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 4)
namae_cat = "Buffet" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 4)


namae_cat = "Desserts" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 5)
namae_cat = "Tea & Snacks" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 5)
namae_cat = "Cakes" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 5)
namae_cat = "Pickles" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 5)

namae_cat = "Bottled water" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 6)
namae_cat = "Soft drink" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 6)
namae_cat = "Soda" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 6)
namae_cat = "Water" 
Category.create(name: namae_cat,display_name: namae_cat.parameterize,sub_category: 6)


puts "Faker 20 Location for Store"
10.times do
  Location.create(
    name: Faker::Name.name,
    user_id: 1,
    address: Faker::Address.city,
    phone: Faker::PhoneNumber.cell_phone,
    status: Faker::Boolean.boolean(0.2),
    radius: Faker::Number.between(1, 5)
    )    
end


puts "Faker 200 Dish"
200.times do
  Dish.create(
    name: Faker::Food.dish, 
    display_name: Faker::Name.name, 
    subtitle: Faker::Food.measurement,
    price: Faker::Number.decimal(2),
    description: Faker::Food.ingredient,
    category_id: Faker::Number.between(1, 23),
    active: true
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

  Timeslot.create(
    location_id: locat.id,
    name: "morning",
    start: "8:00",
    end: "10:00"
    )
  Timeslot.create(
    location_id: locat.id,
    name: "morning",
    start: "10:00",
    end: "12:00"
    )
  Timeslot.create(
    location_id: locat.id,
    name: "afternoon",
    start: "14:00",
    end: "16:00"
    )
  Timeslot.create(
    location_id: locat.id,
    name: "afternoon",
    start: "16:00",
    end: "18:00"
    )

  Timeslot.create(
    location_id: locat.id,
    name: "night",
    start: "18:00",
    end: "20:00"
    )

  3.times do
    seat = 0
    floor = 0
    10.times do
      seat+=1
      Seating.create(
        seat_name: floor.to_s+seat.to_s,
        location_id: locat.id,
        floor: seat,
        description: Faker::ChuckNorris.fact
        )
    end
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

puts "Faker 500 Booking"
200.times do
  Booking.create(
    user_id: Faker::Number.between(1, 10),
    location_id: Faker::Number.between(1, 10),
    seat_id: Faker::Number.between(1, 300),
    timeslot_id: Faker::Number.between(1, 50),
    day_to_eat: Faker::Date.between(2.days.ago, Date.today),
    reservation_place: false,
    status: true,
    action: Faker::Number.between(1, 3)
    )
end
500.times do
  CartItem.create(
    booking_id: Faker::Number.between(1, 200),
    cart_id: Faker::Number.between(1, 200),
    dish_id: Faker::Number.between(1, 200),
    price: Faker::Number.decimal(2),
    quantity:Faker::Number.between(1, 3)
    )
end