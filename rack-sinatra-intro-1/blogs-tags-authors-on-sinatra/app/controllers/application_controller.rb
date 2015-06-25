class ApplicationController < Sinatra::Base

  get '/' do
    @posts = Post.all

    erb :"index.html"
  end

  get '/authors' do
    @authors = Author.all

    erb :"authors.html"
  end
end