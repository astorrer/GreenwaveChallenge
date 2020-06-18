# Greenwave Code Challenge (Aaron Storrer)

This application was created as an interview challenge.

Application Information

* Ruby 2.7.1
* Rails 6.x.x
* SQLite used in development. PostgreSQL in production.
* Tests written in RSPEC.
* Bootstrap 4 used for CSS framework.

## Installing Bootstrap 4
I tried to do this using the bootstrap-rails gem and jQuery, but I quickly figured out that Rails 6.0 had changed.
I ended up following the information on this site to figure it out: https://www.timdisab.com/installing-bootstrap-4-on-rails-6/. I feel like the older asset pipeline was simpler, but that's just me.

## H1 - H3 Heading tags
Nokogiri was used for this requirement. I created a table called tags, using a has_many association between experts and tags. The HTML was parsed within the create action (as specified) immediately after the expert object was saved to the database. 
