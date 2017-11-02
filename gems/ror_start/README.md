rails new ror_start --git
cd ror_start

rails g scaffold project name:string ends_at:date
rails db:migrate

rails g scaffold task title:string done:boolean project:references
rails db:migrate

rails g model comment name:string email:string body:text
rails db:migrate

rails g controller Comments
