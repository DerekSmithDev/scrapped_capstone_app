Begin Capstone

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


12 - 


#git save

  git add --all
  git commit -m ''
  git push origin master


13 - 


#git save

  git add --all
  git commit -m ''
  git push origin master

14 - 


#git save

  git add --all
  git commit -m ''
  git push origin master

15 - 

#git save

  git add --all
  git commit -m ''
  git push origin master

16 - 

#git save

  git add --all
  git commit -m ''
  git push origin master

17 - 

#git save

  git add --all
  git commit -m ''
  git push origin master

18 - 

#git save

  git add --all
  git commit -m ''
  git push origin master

19 - 

#git save

  git add --all
  git commit -m ''
  git push origin master

20 - 



==============================================================================
#git save

  git add --all
  git commit -m ''
  git push origin master



