class PostsController < ApplicationController

  get '/' do # INDEX Action
    @posts = Post.all

    erb :"posts/index.html"
  end
  
  get '/posts/new' do # NEW Action
    erb :"posts/new.html"
  end

  get '/posts/:id/edit' do # EDIT Action
    @post = Post.find(params[:id]) # SELECT * FROM posts WHERE id = ?
    
    erb :"posts/edit.html" 
  end

  put "/posts/:id" do # UPDATE Action
    # To Update a Blog Post
    
    # 1. We need the blog post
    @post = Post.find(params[:id])

    # 2. We need to set it's new values
    # {
    #   :post => {:title => "Title", :content => "Content"}
    #   "_method"=>"PUT", 
    #   "splat"=>[],
    #   "captures"=>["1"], 
    #   "id"=>"1"
    # }
    @post.update(params[:post])

    redirect "/posts/#{@post.id}"
  end

  get '/posts/:id' do # SHOW Action
    @post = Post.find(params[:id])

    erb :"posts/show.html"
  end

  post '/posts' do # CREATE Action
    # @post.update(params[:post])

    post = Post.new(params[:post]) #> {:title => "", etc}
    post.save

    redirect "/posts/#{post.id}"
  end
end








