class SiteController < Sinatra::Base
  set :views, Proc.new{File.join(root, "../views/")}

  register Sinatra::ActiveRecordExtension

  get '/hello' do
    "Lets see"
  end


  get "/posts" do
    @posts = Post.all

    erb :"posts.html"
  end
end