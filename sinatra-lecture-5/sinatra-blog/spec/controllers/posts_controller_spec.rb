require "spec_helper"

describe PostsController do  

  it "handles GET to '/'" do 
    get '/'
    expect(last_response).to be_ok
    expect(last_response.status).to eq(200)
  end

  context 'PUT /posts/1' do
    it 'accepts a bunch of data and updates the posts' do
      @post = Post.create(:title => "Original Title")

      put "/posts/1", {:post => {:title => "New Title"}}
      @post.reload

      expect(@post.title).to eq("New Title")      
    end
  end
end

  
  # it 'includes the title of a blog post' do
  #   post = Post.create(:title => "Hello World")

  #   get '/'

  #   expect(last_response.body).to include(post.title)
  # end

# end
