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

order = Order.create(user_id: 1,  ticket_id:  1,  quantity: 1,  subtotal: 10.00, tax:  0.90,  total:  10.90)
order = Order.create(user_id: 2,  ticket_id:  2,  quantity: 2,  subtotal: 30.00, tax:  2.70,  total:  32.70)
order = Order.create(user_id: 3,  ticket_id:  3,  quantity: 3,  subtotal: 60.00, tax:  5.40,  total:  65.40)
order = Order.create(user_id: 4,  ticket_id:  1,  quantity: 4,  subtotal: 40.00, tax:  3.60,  total:  43.60)
order = Order.create(user_id: 1,  ticket_id:  2,  quantity: 5,  subtotal: 75.00, tax:  6.75, total:  81.75)
order = Order.create(user_id: 2,  ticket_id:  3,  quantity: 6,  subtotal: 120.00,  tax:  10.80, total:  130.80)
order = Order.create(user_id: 3,  ticket_id:  1,  quantity: 1,  subtotal: 10.00, tax:  0.90,  total:  10.90)
order = Order.create(user_id: 4,  ticket_id:  2,  quantity: 2,  subtotal: 30.00, tax:  2.70,  total:  32.70)
order = Order.create(user_id: 1,  ticket_id:  3,  quantity: 3,  subtotal: 60.00, tax:  5.40,  total:  65.40)
order = Order.create(user_id: 2,  ticket_id:  1,  quantity: 4,  subtotal: 40.00, tax:  3.60,  total:  43.60)

event = Event.create(name: "Effie Gray", description: "Film Screening", user_id: 4, venue_id: 4, start_date: "2018-01-20 19:00:00.000", end_date: "2018-01-20 23:59:59.000", status: "sale_ended", sales: 33)
event = Event.create(name: "Mermaids", description: "Live Play", user_id: 4, venue_id: 1, start_date: "2018-03-09 19:00:00.000", end_date: "2018-03-09 23:59:59.000", status: "sale_ended", sales: 53)
event = Event.create(name: "Charlie Chan's Courage", description: "Sing a long", user_id: 2, venue_id: 9, start_date: "2018-07-19 19:00:00.000", end_date: "2018-07-19 23:59:59.000", status: "sale_ended", sales: 96)
event = Event.create(name: "Fantasia", description: "viewing", user_id: 2, venue_id: 10, start_date: "2018-11-30 19:00:00.000", end_date: "2018-11-30 23:59:59.000", status: "on_sale", sales: 81)
event = Event.create(name: "Trick or Treat", description: "live event", user_id: 3, venue_id: 2, start_date: "2018-12-02 19:00:00.000", end_date: "2018-12-02 23:59:59.000", status: "on_sale", sales: 85)
event = Event.create(name: "Scandal Sheet", description: "Stage adaptation", user_id: 1, venue_id: 7, start_date: "2019-01-18 19:00:00.000", end_date: "2018-01-18 23:59:59.000", status: "on_sale", sales: 33)
event = Event.create(name: "Detention", description: "improv revue", user_id: 1, venue_id: 4, start_date: "2019-03-11 19:00:00.000", end_date: "2019-03-11 23:59:59.000", status: "pending", sales: 31)
event = Event.create(name: "Rock 'n' Roll Nightmare", description: "concert", user_id: 2, venue_id: 10, start_date: "2019-05-06 19:00:00.000", end_date: "2019-05-06 23:59:59.000", status: "pending", sales: 70)
event = Event.create(name: "Wheels on Meals", description: "charity", user_id: 3, venue_id: 8, start_date: "2019-07-17 19:00:00.000", end_date: "2019-07-17 23:59:59.000", status: "pending", sales: 33)
event = Event.create(name: "The Adventures of Picasso", description: "art display", user_id: 3, venue_id: 3, start_date: "2019-09-08 19:00:00.000", end_date: "2019-09-08 23:59:59.000", status: "pending", sales: 55)