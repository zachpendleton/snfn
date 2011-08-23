# Snfn - A Sinatra application generator

Snfn is an opinionated generator for Sinatra projects. It
can be configured using the following options:

*  `-d` Database. Options are "postgres," "mysql," "sqlite",
   and "mongo." Default is "sqlite."
*  `--redis` Include Redis configuration options.
* `--no-database` Don't include any database config options.
* `--no-heroku` Don't include Heroku config options.

## Installation

    gem install snfn

## Example

Standard Heroku app, using sqlite for local development and
PostgreSQL for production.

    snfn my_app

App without Heroku options and mysql config.

    snfn my_app -d mysql --no-heroku

## Architecture

The template autoloads files in config/initializers and
/lib. Database configuration options are stored in `config/db.yml`
and are loaded via `config/initializers/database.rb`.

Right now Snfn only comes out of the box with support for Unicorn, (the
config file is stored at config/unicorn.rb), but changing it out for
thin or mongrel is pretty trivial.

## DB Setup

[Sequel](http://sequel.rubyforge.org) is used as an ORM for
relational databases, and migrations are stored in db/migrate.
Migrations can be run using the rake command `rake rb:migrate`.

MongoMapper is used for Mongo apps, with the config options
stored in the same files as relational databases (`config/db.yml`
and `config/initializers/database.rb`).

### More information

*  [Sequel Migrations](http://sequel.rubyforge.org/rdoc/files/doc/migration_rdoc.html)
*  [Sequel Models](http://sequel.rubyforge.org/rdoc/classes/Sequel/Model.html)
*  [MongoMapper](http://mongomapper.com)

If there is any interest in supporting other ORMs like DataMapper or
ActiveRecord, either please let me know or implement it yourself and
send a pull request.

## Set up on Heroku

By default, Snfn creates an app with the proper options for deployment
on Heroku. To get Snfn up and running on Heroku:

1.  Install your gems with `bundle install`
2.  Create a new git repository: `git init .`
3.  Make your first commit: `git add .; git commit -m "initial commit"`
4.  Create a new heroku app: `bundle exec heroku create --stack cedar`
5.  Deploy the app: `git push heroku master`

### Heroku Add-Ons

To use PostgreSQL, MongoDB, or Redis on Heroku, you'll need to add
the proper Heroku add-ons. The commands to do this are, respectively:

    heroku addons:add shared-database # PostgreSQL
    heroku addons:add mongolab:starter # MongoDB
    heroku addons:add redistogo:nano # Redis

