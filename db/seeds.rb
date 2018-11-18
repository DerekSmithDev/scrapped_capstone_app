# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "peter", email: "peter@email.com", password: "password", password_confirmation: "password")
user = User.create(name: "adam", email: "adam@email.com", password: "password", password_confirmation: "password")
user = User.create(name: "russell", email: "russell@email.com", password: "password", password_confirmation: "password")
user = User.create(name: "test", email: "test@email.com", password: "password", password_confirmation: "password")

ticket = Ticket.create(event_id: 1, price: 10.00)
ticket = Ticket.create(event_id: 2, price: 15.00)
ticket = Ticket.create(event_id: 3, price: 20.00)
