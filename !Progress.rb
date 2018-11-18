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


==============================================================================


  rails db:seed





#6 - Create a route that displays JSON for all the available user.



#6.a - Use git to add, commit, and push your code.




#7 - Make some routes to display JSON for individual products.







#git save

  git add --all
  git commit -m ''
  git push origin master







Bonus: Make a Ruby frontend script using the HTTP gem to display the results in the terminal instead of a web browser!
7.a - Use git to add, commit, and push your code.

Bonus: In your Ruby frontend script, use the tty-table gem (https://github.com/piotrmurach/tty-table) to print out the results with tables in the terminal!
GitHub
piotrmurach/tty-table
A flexible and intuitive table generator. Contribute to piotrmurach/tty-table development by creating an account on GitHub.