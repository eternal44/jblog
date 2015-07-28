# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Writer

User.create!(email: "jamesyoun710@gmail.com",
             password: "password1234",
             password_confirmation: "password1234")

#Posts
user = User.first

20.times do
  title = "Fake blog post"
  text = Faker::Lorem.sentence(400)
  user.posts.create!(title: title, text: text)
end
