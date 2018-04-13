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