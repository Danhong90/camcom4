bundle install
rails generate devise:install
rails generate devise user
rake db:migrate
rails generate devise:views
bundle
rails g migration AddOmniauthToUsers provider:index uid:index
rake db:migrate
rails g devise controller users
rails g model post
rake db:migrate
rails c 
RAILS_ENV=production bundle exec rake assets:precompile
bundle exec rake --trace assets:precompile
kill -9 18558
rails generate migration add_type_to_userhashrels type:integer
rake db:migrate
rails generate migration ChangeColumnName
rake db:migrate
