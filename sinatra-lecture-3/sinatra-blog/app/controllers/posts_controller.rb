class PostsController < ApplicationController

  get '/' do # INDEX Action
    @posts = Post.all

    erb :"posts/index.html"
  end
  
  get '/posts/new' do # NEW Action
    erb :"posts/new.html"
  end


  get '/posts/:id' do # SHOW Action
    @post = Post.find(params[:id])

    erb :"posts/show.html"
  end

  post '/posts' do
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.save

    redirect "/posts/#{post.id}"
  end
end