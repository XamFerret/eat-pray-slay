# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user1 = User.create!(
  email: "michael@halloween.com",
  password: "xxxxxx",
  username: "michael",
  occupation: "stalker",
  location: "Haddonfield",
  age: 49,
  bio: "Wore mask before covid"
)
user2 = User.create!(
  email: "hellpriest@halloween.com",
  password: "xxxxxx",
  username: "Hellpreiest",
  occupation: "SM Artist",
  location: "Hell",
  age: 1000,
  bio: "Love hooking up"
)
user3 = User.create!(
  email: "ghostface@halloween.com",
  password: "xxxxxx",
  username: "Ghostface",
  occupation: "Phone operator",
  location: "Callcenter",
  age: 35,
  bio: "Hide and seed specialist"
)

user4 = User.create!(
  email: "demo@halloween.com",
  password: "xxxxxx",
  username: "Demogorgan",
  occupation: "Monster",
  location: "Upside Down",
  age: 100,
  bio: "create portals and shit"
)

user5 = User.create!(
  email: "freddie@halloween.com",
  password: "xxxxxx",
  username: "Freddie",
  occupation: "Sandman",
  location: "Your dreams",
  age: 55,
  bio: "1,2, freddie comes for you"
)

user6 = User.create!(
  email: "jason@halloween.com",
  password: "xxxxxx",
  username: "Jason Vorhees",
  occupation: "Camper",
  location: "Camp Crystal Lake",
  age: 45,
  bio: "drowned and came back to life"
)
