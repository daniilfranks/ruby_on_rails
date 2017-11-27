# Rake
lib/tasks/myrake.rake
rake first:hello

rails g scaffold articles title:string description:text is_published:boolean user:references --no-test-framework
rails g scaffold users name:string email:string password_digest:string banned:boolean --no-test-framework
rails g controller session new create destroy
rails g controller sessions new --no-helper --no-assets --no-controller-specs
rails g model vote article:references user:references
rails g controller votes create

rails g controller static_pages home
rails g model student f_name:string l_name:string
rails g controller students

rails g scaffold posts title:string description:string --no-test-framework

rails g migration AddactiveToStudents active:boolean
add_column :students, :active, :boolean, default: :false

rails g model product name:string price:decimal
rails g model cart 
rails g model cart_products cart:references product:references

rails g scaffold categories name:string
rails g migration Addcategory_idToPosts
add_column :posts, :category_id, :integer

rails g migration Adduser_idToPosts
add_column :posts, :user_id, :integer

rails g scaffold tags name:string --no-test-framework
rails g scaffold post_tags post:references tag:references --no-test-framework

rails g scaffold products title:string price:decimal{8,2}
add_column :products, :price, :decimal, precision: 8, scale: 2

rails db:migrate
rails db:migrate RAILS_ENV=test

# Git
git checkout master
gei checkout -b static-pages

rails g scaffold static_pages home contact

git add -A
git commit -m "Add a Static Pages controller"
git push -u origin static-pages

git add -A
git commit -m "Finish static pages"
git checkout master
git merge static-pages
git push

ps aux
ps aux | grep postgres
kill -9 12241
pkill -9 -f postgres

rspec
guard
rubocop -R

rspec
/home/boban/ruby_on_rails/gems/rcasts2/coverage

rails stats

rails g rspec:controller statik_page


#http://matchers.shoulda.io/docs/v3.1.1/
#http://www.rubydoc.info/github/teamcapybara/capybara/master
#https://devhints.io/capybara
#https://relishapp.com/rspec/rspec-expectations/v/3-7/docs

# rendering
<%= render partial: 'authors/author', locals: { post_author: @post.author } %>

# _author.html.erb
<%= post_author.name %>
<%= post_author.hometown %>

