rails g controller static_pages home

# Test
Gemfile
  gem 'bullet'
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'simplecov'
  gem 'parallel_tests'
  gem 'database_cleaner'
  gem 'faker'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'guard'
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem "rubocop", require: false
  gem "rubocop-rails"
  gem 'guard-rubocop'
  gem 'pry-rails'
  gem 'pry-byebug'

# Rspec
# https://relishapp.com/rspec/rspec-rails/docs
rails generate rspec:install
rspec

# https://relishapp.com/rspec/rspec-rails/docs/generators
rails g rspec:scaffold project
rails g rspec:model task
rails g rspec:controller task

# application.rb
config.generators do |g|
  g.factory_bot false
end

create folder spec/factories
rails stats
# /home/boban/ruby_on_rails/gems/rcasts/coverage

guard init rails
guard init rspec
#guard init rubocop
guard

create file .rubocop.yml
rubocop -a
rubocop -R

spec/rails_helper.rb
require 'capybara/rails'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.default_driver = :selenium_chrome_headless


create folder spec/support
database_cleaner.rb
factory_bot.rb
shoulda_matchers.rb
