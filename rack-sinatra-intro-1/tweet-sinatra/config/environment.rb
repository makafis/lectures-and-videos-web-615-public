require 'bundler'
Bundler.require

require_all 'app'

TWITTER = Twitter::REST::Client.new do |config|
  # Go to https://dev.twitter.com/apps and create a new twitter application and generate these keys and tokens
  config.consumer_key = "9vahfyWzOnjJxj83SJxROQ"
  config.consumer_secret = "aYCt7k10fYf4svlSNz9oP7GbFi1QYPnUdvpOZpjgwYM"
  config.access_token = "2085091-yC77I7mMDymORhRq8lstGtMMq5kqE4DthGxjJeXjRd"
  config.access_token_secret = "e1tanGnqsn8AWRhVOeDNfKiApetFyql4shuahYhkAupNL"
end

require "sinatra/activerecord"

# set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
ActiveRecord::Base.establish_connection({adapter: "sqlite3", database: "db/foo.sqlite3"})