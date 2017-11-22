# Rake
lib/tasks/myrake.rake
rake first:hello

rails g scaffold articles title:string description:text is_published:boolean user:references
rails g scaffold users name:string email:string password_digest:string banned:boolean
rails g controller session new create destroy
rails g model vote article:references user:references
rails g controller votes create

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
