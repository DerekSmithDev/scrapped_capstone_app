Begin Capstone

#Users Login authentication
  #1 - Create a new rails api app called capstone with a postgres database (notice no `--database=postgresql`, this is because we just added defaults to our .railsrc file!):

    rails new capstone_app

  #2.a - Use git to initialize, add, and commit your code.
  #2.b - Use GitHub to create a repo called capstone_app, then copy and paste the commands to push your git repo to GitHub.

    git remote add origin git@github.com:dereksmith83/capstone_app.git
    git push -u origin master

    https://github.com/dereksmith83/capstone_app


  #3 -  Create an `api/users` controller (plural!)
    
    rails generate controller api/users

  #git save

    git add --all
    git commit -m 'created api/users controller'
    git push origin master
    

  #4 - Create a `User` model

    rails generate model User name:string email:string password_digest:string

  #git save

    git add --all
    git commit -m 'created User model'
    git push origin master

  #4.a Double heck the migration file the migrate User model to data base

    rails db:migrate

  #git save

    git add --all
    git commit -m 'migrated User model data base'
    git push origin master

  #6 - Update seeds file

  #git save

    git add --all
    git commit -m 'updated seeds file'
    git push origin master


  #6 - Update User validations in user.rb
    has_secure_password
    validates :email, presence: true, uniqueness: true

  #git save

    git add --all
    git commit -m 'updated user validations'
    git push origin master

  #7 - uncomment bcrypt gem
  # in terminal

    bundle install

      #then

    rails server

  #8 - Seed the data base

    rails db:seed

  #git save

    git add --all
    git commit -m 'seeded the data base'
    git push origin master


  #9 - Add user create route and controller
  # in routes.rb
    namespace :api do
      post"/users" => "users#create"
    end

  # in api/users_controller.rb
    def create
      user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )

      if user.save
        render json: {message: 'User created successfully'}, status: :created
      else
        render json: {errors: user.errors.full_messages}, status: :bad_request
      end
    end


  #git save

    git add --all
    git commit -m 'added user create route and controller'
    git push origin master


  #10 - Set up insomnia Environments and Paths

  #git save

    git add --all
    git commit -m 'set-up insomnia environments & paths'
    git push origin master

  #11 - Add jwt gem
    #in gemfile
      gem 'jwt'
    
      #stop server
      
      #in terminal 
        bundle install
        rails server

    11a. Create sessions controller

      rails generate controller api/sessions

  #git save

    git add --all
    git commit -m 'added jwt gem & created sessions controller'
    git push origin master


  #12 - Add create sessions route and controller method
    post "/sessions" => "sessions#create"

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        jwt = JWT.encode(
        {
         user_id: user.id, # the data to encode
         exp: 24.hours.from_now.to_i # the expiration time
         },
         Rails.application.credentials.fetch(:secret_key_base), # the secret key
         'HS256' # the encryption algorithm
        )
        render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
      else
        render json: {}, status: :unauthorized
      end
    end

  #git save

    git add --all
    git commit -m 'added create sessions route and controller method'
    git push origin master


  #13 - add backend user authentication
    #in application_controller.rb
    def current_user
      auth_headers = request.headers['Authorization']
      if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
        token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
        begin
          decoded_token = JWT.decode(
            token,
            Rails.application.credentials.fetch(:secret_key_base),
            true,
            { algorithm: 'HS256' }
          )
          User.find_by(id: decoded_token[0]["user_id"])
        rescue JWT::ExpiredSignature
          nil
        end
      end
    end

    helper_method :current_user

    def authenticate_user
      unless current_user
        render json: {}, status: :unauthorized
      end
    end

    def authenticate_admin
      unless current_user && current_user.admin
        render json: {}, status: :unauthorized
      end
    end

  #git save
    git add --all
    git commit -m 'add backend user authentication'
    git push origin master

'Need to fix tickets_controller methods'
Tickets 
  #1 - create tickets_controller
    rails generate controller api/tickets

    #git save
    git add --all
    git commit -m 'created tickets_controller'
    git push origin master

  #2 - create and migrate Ticket model update seeds file with tickets & seed database
    rails generate model Ticket event_id:integer 'price:decimal{9,2}'
    #double check migration
    rails db:migrate

    ticket = Ticket.create(event_id: 1, price: 10.00)
    ticket = Ticket.create(event_id: 2, price: 15.00)
    ticket = Ticket.create(event_id: 3, price: 20.00)

    #stop server
    rails db:reset

    rails server

    #git save
    git add --all
    git commit -m 'created & migrated Ticket model updated seeds file with tickets & seedd database'
    git push origin master

  3 - add tickets_controller methods & association
    belongs_to :event




    #git save
    git add --all
    git commit -m 'added tickets_controller methods & association'
    git push origin master


  #4 - add tickets restful routes & test
      get"/tickets" => "tickets#index"
      post"/tickets" => "tickets#create"
      get"/tickets/:id" => "tickets#show"
      patch"/tickets/:id" => "tickets#update"
      delete"/tickets/:id" => "tickets#destroy"

      #git save
      git add --all
      git commit -m 'added tickets restful routes & tested successfully'
      git push origin master

Venue
  #1 - create venues_controller
    # rails generate controller api/venues

    # #git save
    # git add --all
    # git commit -m 'created venues_controller'
    # git push origin master

  #2 - create Venue model 
    # rails generate model Venue name:string address:string city:string state:string zip:string website:string contact:string email:string phone:string capacity:integer      

    # #git save
    # git add --all
    # git commit -m 'created Venue model'
    # git push origin master

  #3 - update seeds file with venues & seed database
    # venue = Venue.create(name:  "Aldie's",  address:  "91 Arrowood Court",  city: "Largo",  state:  "FL", zip:  "34643",  website:  "www.Aldies.com", contact:  "Chadd",  email:  "Chadd@Aldies.com", phone:  "727-729-4386", capacity: 227)

    # venue = Venue.create(name:  "Zoppo's",  address:  "76396 Weeping Birch Street", city: "Carlsbad", state:  "CA", zip:  "92013",  website:  "www.Zoppos.com", contact:  "Melisenda",  email:  "Melisenda@Zoppos.com", phone:  "760-715-2618", capacity: 221)

    # venue = Venue.create(name:  "Gellett's",  address:  "14 Marcy Junction",  city: "Fresno", state:  "CA", zip:  "93709",  website:  "www.Gelletts.com", contact:  "Daile",  email:  "Daile@Gelletts.com", phone:  "559-430-6277", capacity: 104)

    # venue = Venue.create(name:  "Prinne's", address:  "7066 Loomis Place",  city: "Virginia Beach", state:  "VA", zip:  "23471",  website:  "www.Prinnes.com",  contact:  "Emanuele", email:  "Emanuele@Prinnes.com", phone:  "757-592-3848", capacity: 112)

    # venue = Venue.create(name:  "Pexton's", address:  "8522 Farmco Junction", city: "Los Angeles",  state:  "CA", zip:  "90081",  website:  "www.Pextons.com",  contact:  "Harman", email:  "Harman@Pextons.com", phone:  "213-763-3465", capacity: 82)

    # venue = Venue.create(name:  "Duro's", address:  "4720 Green Lane",  city: "Tacoma", state:  "WA", zip:  "98417",  website:  "www.Duros.com",  contact:  "Alvin",  email:  "Alvin@Duros.com",  phone:  "253-413-2718", capacity: 280)

    # venue = Venue.create(name:  "Rowley's", address:  "96 Bayside Terrace", city: "Boise",  state:  "ID", zip:  "83722",  website:  "www.Rowleys.com",  contact:  "Marie-ann",  email:  "Marie-ann@Rowleys.com",  phone:  "208-458-2302", capacity: 111)

    # venue = Venue.create(name:  "Volk's", address:  "4764 Swallow Crossing",  city: "Naples", state:  "FL", zip:  "33963",  website:  "www.Volks.com",  contact:  "Theodosia",  email:  "Theodosia@Volks.com",  phone:  "239-894-8801", capacity: 228)

    # venue = Venue.create(name:  "Redd's", address:  "755 South Parkway",  city: "New Orleans",  state:  "LA", zip:  "70165",  website:  "www.Redds.com",  contact:  "Vivie",  email:  "Vivie@Redds.com",  phone:  "504-637-0038", capacity: 197)

    # venue = Venue.create(name:  "Burbage's",  address:  "1384 Ridge Oak Way", city: "Las Vegas",  state:  "NV", zip:  "89166",  website:  "www.Burbages.com", contact:  "Julio",  email:  "Julio@Burbages.com", phone:  "702-169-2703", capacity: 93)
    
    #stop server
    # rails db:reset

    #git save
      # git add --all
      # git commit -m 'updated seeds file with venues & seeded database'
      # git push origin master

  4 - add venues_controller methods & association


    #git save
    git add --all
    git commit -m 'added venues_controller methods & association'
    git push origin master


  #5 - add venues restful routes & test
    # get"/venues" => "venues#index"
    # post"/venues" => "venues#create"
    # get"/venues/:id" => "venues#show"
    # patch"/venues/:id" => "venues#update"
    # delete"/venues/:id" => "venues#destroy"

    #git save
    git add --all
    git commit -m 'added venues restful routes & tested successfully'
    git push origin master


Orders
  1 - create orders_controller
  rails generate controller api/orders

  #git save
  git add --all
  git commit -m 'created orders_controller'
  git push origin master

  2 - create Order model 
  rails generate model Order user_id:integer ticket_id:integer quantity:integer 'subtotal:decimal{9,2}' 'tax:decimal{9,2}' 'total:decimal{9,2}'

  #git save
  git add --all
  git commit -m 'created Order model'
  git push origin master

  3 - update seeds file with orders & seed database
  order = Order.create(user_id: n, ticket_id: n, quantity: n, subtotal: n, tax: n, total: n)

  #stop server
  rails db:reset

  #git save
  git add --all
  git commit -m 'updated seeds file with orders & seedd database'
  git push origin master

    4 - add orders_controller methods & association


      #git save
      git add --all
      git commit -m 'added orders_controller methods & association'
      git push origin master


    5 - add orders restful routes & test
      get"/orders" => "orders#index"
      post"/orders" => "orders#create"
      get"/orders/:id" => "orders#show"
      patch"/orders/:id" => "orders#update"
      delete"/orders/:id" => "orders#destroy"

      #git save
      git add --all
      git commit -m 'added orders restful routes & tested successfully'
      git push origin master


Events
  #1 - create events_controller
  rails generate controller api/events

  #git save
  git add --all
  git commit -m 'created events_controller'
  git push origin master

  2 - create Event model 
  rails generate model Event name:string description:text user_id:integer venue_id:integer start_date:datetime end_date:datetime status:string sales:integer 

  #git save
  git add --all
  git commit -m 'created Event model'
  git push origin master

  3 - update seeds file with events & seed database
  event = Event.create(name: '', description: '', user_id: n, venue_id: n, start_date: n, end_date: n, status: '', sales: n)

  #stop server
  rails db:reset

  #git save
  git add --all
  git commit -m 'updated seeds file with events & seeded database'
  git push origin master

    4 - add events_controller methods & association


      #git save
      git add --all
      git commit -m 'added events_controller methods & association'
      git push origin master


    5 - add events restful routes & test
      get"/events" => "events#index"
      post"/events" => "events#create"
      get"/events/:id" => "events#show"
      patch"/events/:id" => "events#update"
      delete"/events/:id" => "events#destroy"

      #git save
      git add --all
      git commit -m 'added events restful routes & tested successfully'
      git push origin master

==============================================================================
#git save
  git add --all
  git commit -m ''
  git push origin master


Zz zs
  1 - create zs_controller
    rails generate controller api/zs

    #git save
    git add --all
    git commit -m 'created zs_controller'
    git push origin master

  2 - create Zz model 
    rails generate model Zz column:datatype 

    #git save
    git add --all
    git commit -m 'created Zz model'
    git push origin master

  3 - update seeds file with zs & seed database
    zz = Zz.create(?: '?', ?: '?')

    #stop server
    rails db:reset

    #git save
    git add --all
    git commit -m 'updated seeds file with zs & seeded database'
    git push origin master

  4 - add zs_controller methods & association


    #git save
    git add --all
    git commit -m 'added zs_controller methods & association'
    git push origin master


  5 - add zs restful routes & test
    get"/zs" => "zs#index"
    post"/zs" => "zs#create"
    get"/zs/:id" => "zs#show"
    patch"/zs/:id" => "zs#update"
    delete"/zs/:id" => "zs#destroy"

    #git save
    git add --all
    git commit -m 'added zs restful routes & tested successfully'
    git push origin master



rails generate controller api/venues
rails generate controller api/orders
rails generate controller api/events

rails generate model Order user_id:integer ticket_id:integer quantity:integer 'subtotal:decimal{9,2}' 'tax:decimal{9,2}' 'total:decimal{9,2}'

rails generate model Venue name:string address:string city:string state:string zip:string website:string contact:string email:string phone:string capacity:integer

rails generate model Event name:string description:text user_id:integer venue_id:integer start_date:datetime end_date:datetime status:string sales:integer

venue = Venue.create(name: '', address: '', city: '', state: '', zip: '', website: '', contact: '', email: '', phone: '', capacity: ?)
venue = Venue.create(name: '', address: '', city: '', state: '', zip: '', website: '', contact: '', email: '', phone: '', capacity: n)
event = Event.create(name: '', description: '', user_id: n, venue_id: n, start_date: n, end_date: n, status: '', sales: n)
order = Order.create(user_id: n, ticket_id: n, quantity: n, subtotal: n, tax: n, total: n)
