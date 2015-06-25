class ApplicationController < Sinatra::Base
  set :views, Proc.new{File.join(root, "../views/")}

  get '/' do
    @tweets = TWITTER.search("flatironschool")
    
    erb :"index.html"    
  end

  get '/tweet' do
    erb :"tweet.html"
  end

  post '/send_tweet' do
    TWITTER.update(params[:tweet])
  end  
end