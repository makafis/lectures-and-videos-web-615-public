class PostsController < ApplicationController
  skip_before_action :login_required, :only => [:index]
    
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id]) 
  end


  def edit
    @post = Post.find(params[:id])
  end
  
end
