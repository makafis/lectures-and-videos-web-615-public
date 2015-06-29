require 'sinatra'
require 'pry'

get '/' do
  binding.pry
  "Hello"
end

get '/view' do
  erb :"index.html"
end

run Sinatra::Application