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
