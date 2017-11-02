# README

# Devise
1) rails generate devise:install

2) config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

3) config/routes.rb
root to: "static_pages#index"

4) app/views/layouts/application.html.erb
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>

5)
rails g devise user
rails db:migrate
rails g devise:views users

6) before_action :authenticate_user!

# Pundit
1) /application_controller.rb
include Pundit

2) rails g pundit:install
rails g pundit:policy static_pages

3) static_pages_policy.rb

4) static_pages_controller.rb
def info
  authorize @static_pages
end

# CarrierWave
1) rails generate uploader Img
2) app/uploaders/img_uploader.rb

# Sunspot
1) rails g sunspot_rails:install
2) rake sunspot:solr:start
3) Post.reindex

# ActsAsParanoid
1) rails g migration AddDeletedAtToParanoiac deleted_at:datetime:index

# Active Admin
rails g active_admin:install
rails db:migrate

rails generate active_admin:resource Post
rails generate active_admin:assets

# Hirb
rails c
Hirb.enable

# Pry
rails c
show-models
show-routes

# I18n
#config/application.rb
config.i18n.default_locale = :en

Create config/locales/ru.yml

#app/controllers/application_controller.rb
before_action :set_locale

def default_url_options
  { locale: I18n.locale }
end

private
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

#application.html.erb
<%= link_to "en", locale:"en" %>
<%= link_to "ru", locale:"ru" %>

<p>I18n: <%= t(:hello) %></p>

#config/routes.rb
scope "(:locale)", locale: /en|ru/ do
  root to: 'static_pages#index'
end

#Email
rails g mailer PostMailer

mailers/post_mailer.rb

#app/views/post_mailer/
welcome_email.html.erb
welcome_email.text.erb

#posts_controller.rb
add method in action create
PostMailer.welcome_email(@post).deliver

#Active Job
rails g job guests_cleanup

config/application.rb
config.active_job.queue_adapter = :sidekiq

#app/jobs/guests_cleanup_job.rb

GuestsCleanupJob.perform_later guest

# Debuging
<%= debug @posts %>

/log

gem 'byebug'

byebug
<%= debug(params) if Rails.env.development? %>

rails c

# Rake
lib/tasks
rails g task test
rails test:start


