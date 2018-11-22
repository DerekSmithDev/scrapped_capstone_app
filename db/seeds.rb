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

venue = Venue.create(name:  "Aldie's",  address:  "91 Arrowood Court",  city: "Largo",  state:  "FL", zip:  "34643",  website:  "www.Aldies.com", contact:  "Chadd",  email:  "Chadd@Aldies.com", phone:  "727-729-4386", capacity: 227)

venue = Venue.create(name:  "Zoppo's",  address:  "76396 Weeping Birch Street", city: "Carlsbad", state:  "CA", zip:  "92013",  website:  "www.Zoppos.com", contact:  "Melisenda",  email:  "Melisenda@Zoppos.com", phone:  "760-715-2618", capacity: 221)

venue = Venue.create(name:  "Gellett's",  address:  "14 Marcy Junction",  city: "Fresno", state:  "CA", zip:  "93709",  website:  "www.Gelletts.com", contact:  "Daile",  email:  "Daile@Gelletts.com", phone:  "559-430-6277", capacity: 104)

venue = Venue.create(name:  "Prinne's", address:  "7066 Loomis Place",  city: "Virginia Beach", state:  "VA", zip:  "23471",  website:  "www.Prinnes.com",  contact:  "Emanuele", email:  "Emanuele@Prinnes.com", phone:  "757-592-3848", capacity: 112)

venue = Venue.create(name:  "Pexton's", address:  "8522 Farmco Junction", city: "Los Angeles",  state:  "CA", zip:  "90081",  website:  "www.Pextons.com",  contact:  "Harman", email:  "Harman@Pextons.com", phone:  "213-763-3465", capacity: 82)

venue = Venue.create(name:  "Duro's", address:  "4720 Green Lane",  city: "Tacoma", state:  "WA", zip:  "98417",  website:  "www.Duros.com",  contact:  "Alvin",  email:  "Alvin@Duros.com",  phone:  "253-413-2718", capacity: 280)

venue = Venue.create(name:  "Rowley's", address:  "96 Bayside Terrace", city: "Boise",  state:  "ID", zip:  "83722",  website:  "www.Rowleys.com",  contact:  "Marie-ann",  email:  "Marie-ann@Rowleys.com",  phone:  "208-458-2302", capacity: 111)

venue = Venue.create(name:  "Volk's", address:  "4764 Swallow Crossing",  city: "Naples", state:  "FL", zip:  "33963",  website:  "www.Volks.com",  contact:  "Theodosia",  email:  "Theodosia@Volks.com",  phone:  "239-894-8801", capacity: 228)

venue = Venue.create(name:  "Redd's", address:  "755 South Parkway",  city: "New Orleans",  state:  "LA", zip:  "70165",  website:  "www.Redds.com",  contact:  "Vivie",  email:  "Vivie@Redds.com",  phone:  "504-637-0038", capacity: 197)

venue = Venue.create(name:  "Burbage's",  address:  "1384 Ridge Oak Way", city: "Las Vegas",  state:  "NV", zip:  "89166",  website:  "www.Burbages.com", contact:  "Julio",  email:  "Julio@Burbages.com", phone:  "702-169-2703", capacity: 93)



ticket = Ticket.create(event_id: 1, price: 10.00)
ticket = Ticket.create(event_id: 2, price: 15.00)
ticket = Ticket.create(event_id: 3, price: 20.00)



