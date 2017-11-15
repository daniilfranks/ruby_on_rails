rails g controller static_pages home about
rails g scaffold users name:string email:string password:string
rails g scaffold projects name:string description:text user:references
rails g scaffold tasks title:string description:text complete:boolean priority:integer position:integer project:references user:references

rails g controller sessions new destroy

rails g controller admin/dashboard index

#Bootstrap
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'

app/assets/stylesheets/application.scss
@import "bootstrap";

app/assets/javascripts/application..js
//= require jquery3
//= require popper
//= require bootstrap-sprockets

log/bullet.log
