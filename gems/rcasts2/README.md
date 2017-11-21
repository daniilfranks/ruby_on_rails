# Rake
lib/tasks/myrake.rake
rake first:hello

rails g scaffold articles title:string description:text is_published:boolean user:references
rails g scaffold users name:string email:string password_digest:string banned:boolean
rails g controller session new create destroy
rails g model vote article:references user:references
rails g controller votes create
