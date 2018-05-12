require 'json'
require "faker"

random = Random.new
puts "Faker admin@gmail.com admin1"
puts "Faker 15 Users(admin:0)"
puts "Faker 5 staff(admin:5)"
# /// Edit
User.delete_all
rands = random.rand(1..13)
User.create!(name:  "Admin",
   email: "admin@gmail.com",
   password:              "admin1",
   password_confirmation: "admin1",
   avatar: "logo_restorant/2017"+rands.to_s+".jpg",
   admin: 100
   )

30.times do
  rands = random.rand(1..13)
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password:              "123456",
    password_confirmation: "123456",
    avatar: "logo_restorant/2017"+rands.to_s+".jpg",
    admin: 0
    )
end
puts "Faker 23 Category for 1 Store"
file = File.read('lib/assets/category.json')
data_hash = JSON.parse(file)
data_hash.each do |cate|
  Category.create(
    name: cate['category'],
    display_name: cate['category'].parameterize,
    sub_category: cate['sub_category']
    )
end

puts "Faker 900 Location for Store"
file = File.read('lib/assets/store1.json')
data_hash = JSON.parse(file)
data_hash.each do |store|
  Location.create(
    name: store['storename'],
    user_id: 1,
    address: store['address'],
    phone: store['phone'],
    description: store['des'],
    status: true,
    open_time: store['open_time'],
    radius: Faker::Number.between(1, 5),
    sum_rate: 0,
    rate_avg: 0
    )
end

Location.all.each do |locat|
  3.times do |x|
    title = Faker::Book.title
    content = Faker::HarryPotter.quote + Faker::HarryPotter.quote
    user_id = random.rand(1..25)
    rate_rv = random.rand(0..5)
    Review.create!( title: title,
      content: content,
      user_id: user_id,
      location_id: locat.id,
      rate_score: rate_rv
      )
    locat.update_attributes( :rate_avg => ((locat.sum_rate*locat.rate_avg + rate_rv)/(locat.sum_rate + 1)), :sum_rate => (locat.sum_rate + 1))
end
end
puts "Create 5 Review for each Songs"

puts "Faker 200 Dish"
file = File.read('lib/assets/dish_store.json')
data_hash = JSON.parse(file)
data_hash.each do |dishdata|
  Dish.create(
    location_id: dishdata['location_id'],
    category_id: Faker::Number.between(1, 23),
    name: dishdata['dish'], 
    slug_dish: dishdata['dish'].parameterize, 
    subtitle: Faker::Food.measurement,
    price: Faker::Number.decimal(2),
    description: Faker::Food.description,
    portion: 1,
    serves: 1,
    min_qty: 1,
    active: true)
end

puts "Faker 7 OpeningHours for each location"
locats = Location.all
locats.each do |locat|
  floor = 1
  seat = 1
  Seating.create(
    seat_name: floor.to_s+seat.to_s,
    location_id: locat.id,
    floor: 1,
    description: Faker::ChuckNorris.fact
    )
  seat = 2
  Seating.create(
    seat_name: floor.to_s+seat.to_s,
    location_id: locat.id,
    floor: 1,
    description: Faker::ChuckNorris.fact
    )
  seat = 3
  Seating.create(
    seat_name: floor.to_s+seat.to_s,
    location_id: locat.id,
    floor: 1,
    description: Faker::ChuckNorris.fact
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

Booking.delete_all

puts "Faker 500 Booking"
200.times do
  Booking.create(
    user_id: Faker::Number.between(1, 10),
    location_id: Faker::Number.between(1, 10),
    seat_id: Faker::Number.between(1, 300),
    day_to_eat: Faker::Date.between(2.days.ago, Date.today),
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

file = File.read('lib/assets/city_vietnam.json')
data_hash = JSON.parse(file)
data_hash.each do |city|
  City.create(
    city: city['city'],
    )
end
# load db hanoi
file = File.read('lib/assets/district_hanoi.json')
data_hash = JSON.parse(file)
data_hash.each do |district|
  District.create(
    city_id: 1,
    district: district['district']
    )
end
file = File.read('lib/assets/district_HCM.json')
data_hash = JSON.parse(file)
data_hash.each do |district|
  District.create(
    city_id: 1,
    district: district['district'],
    )
end

