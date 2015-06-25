ENV['SINATRA_ENV'] = "development"

require './config/environment'

run ApplicationController.new