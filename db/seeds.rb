# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name:  "Admin",
#              email: "info@intellection.kz",
#              password:              "Intellection2015",
#              password_confirmation: "Intellection2015",
#              admin: true
#              )
# User.create!(name:  "Bakytzhan",
#              email: "bb@intellection.kz",
#              password:              "tomato1",
#              password_confirmation: "tomato1",
#              teacher: true
#              )
User.create!(name:  "Akzholtay",
             email: "akzholtay.k@gmail.com",
             password:              "Fizik1995",
             password_confirmation: "Fizik1995",
             student: true
             )

# courses = Course.order(:created_at).take(1)
# 5.times do
#   title = Faker::Lorem.sentence(1)
#   short_description = Faker::Lorem.sentence(5)
#   courses.each { |course| course.lessons.create!(title: title, short_description: short_description) }
# end
