require "spec_helper"

describe PostsController do  

  it "handles GET to '/'" do 
    get '/'
    expect(last_response).to be_ok
    expect(last_response.status).to eq(200)
  end

end

  # it 'includes the title of a blog post' do
  #   post = Post.create(:title => "Hello World")

  #   get '/'

  #   expect(last_response.body).to include(post.title)
  # end

# end
