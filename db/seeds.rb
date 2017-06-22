# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Appointment.destroy_all
Course.destroy_all
Establishment.destroy_all
User.destroy_all

user1 = User.create!(email: "test@test.com", password: "123456")
user2 = User.create!(email: "test1@test.com", password: "123456")
user3 = User.create!(email: "test2@test.com", password: "123456")

est1 = Establishment.create!(country: "Spain", city: "Barcelona", user: user1)
est2 = Establishment.create!(country: "Mexico", city: "Cancún", user: user2)
est3 = Establishment.create!(country: "USA", city: "Santa Monica", user: user3)

course1 = Course.create!(title: "English CPE", price: 50, category: "languages", establishment: est1)
course2 = Course.create!(title: "French cuisine", price: 40, category: "cooking", establishment: est2)
course3 = Course.create!(title: "Picasso's influence", price: 12, category: "art", establishment: est3)

app1 = Appointment.create!(date: "07/07/1985", user: user1, course: course1)
app2 = Appointment.create!(date: "07/07/1986", user: user2, course: course2)
app3 = Appointment.create!(date: "07/07/1987", user: user3, course: course3)

rev1 = Review.create!(appointment: app1, course: course1, stars: 3)
rev2 = Review.create!(appointment: app2, course: course2, stars: 4)
rev3 = Review.create!(appointment: app3, course: course3, stars: 5)
