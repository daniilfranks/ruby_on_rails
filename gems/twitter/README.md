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

config/environments/development.rb
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
  end

spec/spec_helper.rb
require 'simplecov'
SimpleCov.start

.gitignore
coverage

rspec
/home/boban/ruby_on_rails/gems/rcasts/coverage

# Static pages
rails g controller static_pages home

rails g controller users new --no-test-framework
rails g model user name:string email:string
rails g migration add_index_to_users_email
add_index :users, :email, unique: true

rails g migration add_password_digest_to_users password_digest:string
rails g controller sessions new --no-test-framework
rails g migration add_remember_digest_to_users remember_digest:string
rails g migration add_admin_to_users admin:boolean

rails db:migrate
rails db:migrate RAILS_ENV=test
rails db:migrate RAILS_ENV=production

rails c
User.create(name: 'Danila', email: 'danila_babanov@yahoo.com', password: '123456', password_confirmation: '123456')

rails db:seed

# Kaminari
gem 'kaminari'

rails g kaminari:config
config/initializers/kaminari_config.rb
config.default_per_page = 10

controller
User.page params[:page]

index.html.erb
<%= paginate @users %>

rails g kaminari:views default


# capybara-webkit'
sudo apt-get update
sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
