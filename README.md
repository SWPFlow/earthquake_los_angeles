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

## Usage

There are a couple of parameters dictated to us by the prompt that are optional.
- start_time
- end_time

```
curl 'http://localhost:3000/?start_time=2016-05-05T09:11:54.460Z&end_time=2017-05-05T09:11:54.460Z'
```

Should give you a JSON of the first 10.

## General Thought Process

I think in general I wanted to have persistent data as opposed to worrying about pulling from an API each time. So I created a database entry that was earth_quake_data_points.  This was only for data points felt in Los Angeles from the original prompt.  

There is a rake task to load the initial month data set.  This will loop through the data and throw them into our database.

Then there is another rake task to be ran periodically to pull from USGS daily updates that dumps data into our database.
