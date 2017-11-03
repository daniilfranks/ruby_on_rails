rails g scaffold posts title:string description:string publishing:boolean rating:integer
rails db:migrate

rails g scaffold comments name:string body:string post:references
rails db:migrate
