# README
## Setup
```
rvm install ruby-2.4.0
bundle install
rake db:migrate
rake earthquake_data:load
rails s
```
## Updates
Update from the USGS daily feed
```
rake earthquake_data:update
```

## Ruby version
Ruby 2.4.0


## Run the Specs
```
bundle exec rspec spec
```

## General Thought Process
