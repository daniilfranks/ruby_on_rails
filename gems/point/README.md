rails new point -d postgresql --no-test-framework
rails g scaffold url url:string

git commit -m '[#1] Scaffold Url'

create file .rubocop.yml
rubocop -a
rubocop -R
