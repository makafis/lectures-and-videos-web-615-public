class PostsController < ApplicationController

  get '/' do # INDEX Action
    @posts = Post.all

    erb :"posts/index.html"
  end
  
  get '/posts/:id' do # SHOW Action
    @post = Post.find(params[:id])

    erb :"posts/show.html"
  end
end