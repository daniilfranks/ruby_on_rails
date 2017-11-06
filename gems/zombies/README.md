rails g scaffold posts title:string description:string publishing:boolean rating:integer
rails db:migrate

rails g scaffold comments name:string body:string post:references
rails db:migrate

rails g model category name:string
rails g migration create_categories_posts category_id:integer post_id:integer
rake db:migrate





