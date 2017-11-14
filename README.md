rails g scaffold Post title:string description:string
rails db:migrate

# Deploy:
Create app in heroku 'deploy-railsonrails'

heroku login
git init
heroku git:remote -a deploy-railsonrails
git add .
git commit -am "make it better"
git push heroku master
