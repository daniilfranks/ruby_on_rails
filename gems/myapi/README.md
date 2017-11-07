rails new myapi --api

rails g scaffold article title:string content:text
rails g serializer article
rails db:migrate

rails db:seed

curl http://localhost:3000/articles