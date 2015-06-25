# config.ru

require 'sinatra'

get('/') do
  "Hi!!!!! #{Time.now}"
end

get '/about' do
  "Hello World"
end

get '/team' do
  "Hashrockets"
end

get '/careers' do
  "Lots of em"
end


run Sinatra::Application