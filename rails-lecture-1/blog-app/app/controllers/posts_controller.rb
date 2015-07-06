class PostsController < ApplicationController
  
  def index
    @posts = Post.all    
  end  

  def show
    @post = Post.find(params[:id])
  end

  def new
    # @tags = Tag.all
    @post = Post.create(:title => "Hello")
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    if @post.save
      redirect_to post_path(@post)
    else
      # redirect_to new_post_path
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id]) # SELECT * FROM posts WHERE id = ?
    @tags = Tag.all
  end
  
  def update
  end

  def destroy
  end
end
