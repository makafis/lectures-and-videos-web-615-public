class PostsController < ApplicationController

  get '/' do # INDEX
    @posts = Post.all

    erb :"posts/index.html"
  end

  get '/posts/new' do # NEW

    erb :"posts/new.html"
  end

  get "/posts/:id" do # SHOW
    @post = Post.find(params[:id])

    erb :"posts/show.html"
  end

  post '/posts' do # CREATE
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save

    redirect "/posts/#{@post.id}"
  end  

end

# 1. Index all blogs posts
# 2. show a blog posts
# 3. present the user with a form to write a blog posts
# 4. accept that forms data and create a blog post