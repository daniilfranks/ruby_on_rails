rails g controller static_pages home about
rails g scaffold users name:string email:string password:string
rails g scaffold projects name:string description:text user:references
rails g scaffold tasks title:string description:text complete:boolean priority:integer position:integer project:references user:references

rails g controller sessions new destroy

rails g controller admin/dashboard index

rails g scaffold homeworks name:string complete:boolean

rails g scaffold categories name:string
rails g model category_homeworks category:references homework:references

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

# Kaminari
gem 'kaminari'

rails g kaminari:config
config/initializers/kaminari_config.rb
config.default_per_page = 10

controller
Task.position.page params[:page]

index.html.erb
<%= paginate @tasks %>

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

rails g rspec:feature projects

# Install Chrome, ChromeDriver and Selenium on Ubuntu 16.04

# Versions
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
SELENIUM_STANDALONE_VERSION=3.4.0
SELENIUM_SUBDIR=$(echo "$SELENIUM_STANDALONE_VERSION" | cut -d"." -f-2)

# Install dependencies.
sudo apt-get update
sudo apt-get install -y unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4

# Install Chrome.
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

# Install ChromeDriver.
wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
unzip ~/chromedriver_linux64.zip -d ~/
rm ~/chromedriver_linux64.zip
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver

# Install Selenium.
wget -N http://selenium-release.storage.googleapis.com/$SELENIUM_SUBDIR/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar -P ~/
sudo mv -f ~/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar /usr/local/bin/selenium-server-standalone.jar
sudo chown root:root /usr/local/bin/selenium-server-standalone.jar
sudo chmod 0755 /usr/local/bin/selenium-server-standalone.jar

guard init rails
guard init rspec
guard init rubocop
guard

create file .rubocop.yml
rubocop -a
rubocop -R

