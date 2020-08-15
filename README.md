# Ruby On Rails Getting Started on GCP

The project is based on the official [Getting Started](https://guides.rubyonrails.org/getting_started.html) from the Ruby On Rails team. I will write a detailed post on my [blog](https://dev.to/hadyrashwan) very soon.

The project used the following:

* Ruby version: 2.7.0

* System dependencies: `sqlite3` and `mysql`

* Database : Mysql 

Deployment on GCP as serverless :

> The project uses Google Cloud Run as a serverless backend. 

* [Setup Google Cloud SQL for Mysql](https://cloud.google.com/sql/docs/mysql/create-instance).
* [Configuring private IP for the database](https://cloud.google.com/sql/docs/mysql/configure-private-ip) .
* Add a database called `ruby_blog_mysql_development` to your cloud sql instance.
* Run `rake secret` command and write down the output. This will be our secret key.
* Update the `deploy.sh` file with your project ID.
* Install [gcloud](https://cloud.google.com/sdk/install) and run `./deploy.sh`. Write down the deployment URL.
* [Enable Cloud SQL on Cloud Run](https://cloud.google.com/sql/docs/mysql/connect-run).
* [Update your environment variables](https://cloud.google.com/run/docs/configuring/environment-variables) with the following:
    
    | Key         | Value         
    | ------------- |:-------------:|
    | BLOG_DATABASE_HOST     |  Private IP |
    | BLOG_DATABASE_PASSWORD      | Password|
    | SECRET_KEY_BASE | Secret key     |
* Your app should be ready now go to the deployment URL on your browser .
*  In my test the response took over 20 seconds coming from a cold start and  254 ms afterwards. 
* I disabled the webpack caching mechanism and used environment variables instead of the [secret manger](https://cloud.google.com/secret-manager/docs/creating-and-accessing-secrets#create_a_secret) for the demo purposes.

Running on local:

* Setup Mysql environment.
* Create A new database called `ruby_blog_mysql_development`.
* Clone the project.
* Change the password in `database.yml` line 18 to your mysql password.
* Run `cd ruby-on-rails-getting-started/`.
* Run `gem install bundler && bundle install`.
* Run `bundle install`.
* Run `rails db:migrate`.
* Start the app using `rails server` command.