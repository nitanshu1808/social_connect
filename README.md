# Introduction

This responsive web application allows user to display their instagram picture feeds,
Furthermore, there are two ways how user can register on web application
 * Normal registration process which requires full_name, user_name and password.
 * Using instagram via Omniauth.


# IMPLEMENTATION

This covers the necessary steps to get the application up and running.

1. Install Ruby Version Manager (RVM), consider the link provided below for installation if needed
   https://rvm.io/
2. On successfully installing rvm install ruby version greater or equal '2.4.1'

3. Take a clone from github

4. Install postgres pg as the database for Active Record, consider the link provided below for installation if needed
  https://www.postgresql.org/

5. On successfully installing pg, run the following commands
  * rake db:create  #This would create a database for the application
  * rake db:migrate #This would alter your database schema over time in a consistent and easy way.

6. Run bundle command within the repository inorder to install all the gems (packages).

7. In order to set up the configurations, consider the following steps

  1. Create a application on the developers instagram, Consider the url below if required
    https://www.instagram.com/developer/. 
  2. On successful app creation add the information details followed by adding Valid OAuth Redirect URIs for example https://localhost:3000/users/auth/instagram/callback(Note: you can remove localhost and your own application url)
  3. Copy the App ID and App Sectret

8. Create a .env file and add
  INSTA_APP_ID: YOUR APP ID
  INSTA_APP_SECRET: YOUR APP SECRET

9. This would setup the application

13. In order to verify, run rspec with the repository. This would run all the tests.

14. Within the repository, run rails s and start working



# Deployment instructions

The following steps were involved in deploying the code to the server.

1. Install Heroku on the system (Install-Heroku)

2. heroku create or heroku apps:create app_name
The command creates a new empty application on Heroku, along with an associated empty ’Git
repository’.

3. heroku git: remote -a app name
Git remote command confirms that a remote named heroku has been set for our application.

4. git push heroku master
Git push command pushes the code from our local repository’s master branch to the heroku
remote.

5. On successful deployment, the authors added all the necessary environment variables (INSTA_APP_ID, INSTA_APP_SECRET) for the heroku repo.

6. heroku run rake db:migrate
This command was used to create database with all the migrations.

