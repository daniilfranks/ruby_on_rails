rails g controller static_pages home about
rails g scaffold users name:string email:string password:string
rails g scaffold projects name:string description:text user:references
rails g scaffold tasks title:string description:text complete:boolean priority:integer position:integer project:references user:references
