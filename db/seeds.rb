# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([
  {
    first_name: "Ant-Man",
    last_name: "Peyton Reed",
    email: "skeul@gmail.com",
    password: "spiderman"
  },
  {
    first_name: "Man",
    last_name: "Reed",
    email: "bawara@gmail.com",
    password: "spiderman"
  },
  {
    first_name: "Man",
    last_name: "Reed",
    email: "morike@gmail.com",
    password: "spiderman"
  },
  {
    first_name: "Powar",
    last_name: "Rally",
    email: "justine@gmail.com",
    password: "spiderman"
  }
])