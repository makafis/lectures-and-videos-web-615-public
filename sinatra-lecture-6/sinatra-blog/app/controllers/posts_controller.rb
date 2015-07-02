class PostsController < ApplicationController

  get '/' do # INDEX Action
    @posts = Post.all

    erb :"posts/index.html"
  end
  
  get '/posts/new' do # NEW Action
    @tags = Tag.all

    erb :"posts/new.html"
  end

  get '/posts/:id/edit' do # EDIT Action
    @post = Post.find(params[:id]) # SELECT * FROM posts WHERE id = ?
    @tags = Tag.all

    erb :"posts/edit.html" 
  end

  put "/posts/:id" do # UPDATE Action

    @post = Post.find(params[:id])
    
    @post.update(params[:post])
    @post.tags.clear if !params[:post][:tag_ids]

    redirect "/posts/#{@post.id}"
  end

  get '/posts/:id' do # SHOW Action
    @post = Post.find(params[:id])

    erb :"posts/show.html"
  end

  post '/posts' do # CREATE Action
    post = Post.new(params[:post]) 
    post.save

    redirect "/posts/#{post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy

    redirect '/'
  end
end








