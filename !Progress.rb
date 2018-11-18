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

#Tickets
#1 - create tickets_controller
  rails generate controller api/tickets

  #git save
  git add --all
  git commit -m 'created tickets_controller'
  git push origin master

#2 - create Ticket model
  rails generate model Ticket event_id:integer price:'price:decimal{10,2}'

  #git save
  git add --all
  git commit -m 'created Ticket model'
  git push origin master

#3 - update seeds file with tickets & seed database
  ticket = Ticket.create(event_id: 1, price: 10.00)
  ticket = Ticket.create(event_id: 2, price: 15.00)
  ticket = Ticket.create(event_id: 3, price: 20.00)

  #git save
  git add --all
  git commit -m 'updated seeds file with tickets & seedd database'
  git push origin master

4 - add tickets_controller methods & association
  belongs_to :event

  


  #git save
  git add --all
  git commit -m 'added tickets_controller methods & association'
  git push origin master


5 - add tickets restful routes & test
    get"/tickets" => "tickets#index"
    post"/tickets" => "tickets#create"
    get"/tickets/:id" => "tickets#show"
    patch"/tickets/:id" => "tickets#update"
    delete"/tickets/:id" => "tickets#destroy"

  #git save
  git add --all
  git commit -m 'added tickets restful routes & tested successfully'
  git push origin master




==============================================================================
#git save

  git add --all
  git commit -m ''
  git push origin master


xxx
  1 - create xxxs_controller
    rails generate controller api/xxxs

    #git save
    git add --all
    git commit -m 'created xxxs_controller'
    git push origin master

  2 - create xxx model #
    rails generate model Xxx column:datatype #

    #git save
    git add --all
    git commit -m 'created Xxx model'
    git push origin master

  3 - update seeds file with xxxs & seed database
    xxx = Xxx.create(?: '??', ?: '??')

    rails db:reset
    rails db:seed

    #git save
    git add --all
    git commit -m 'updated seeds file with xxxs & seedd database'
    git push origin master

  4 - add xxxs_controller methods & association


    #git save
    git add --all
    git commit -m 'added xxxs_controller methods & association'
    git push origin master


  5 - add xxxs restful routes & test
    get"/xxxs" => "xxxs#index"
    post"/xxxs" => "xxxs#create"
    get"/xxxs/:id" => "xxxs#show"
    patch"/xxxs/:id" => "xxxs#update"
    delete"/xxxs/:id" => "xxxs#destroy"

    #git save
    git add --all
    git commit -m 'added xxxs restful routes & tested successfully'
    git push origin master
