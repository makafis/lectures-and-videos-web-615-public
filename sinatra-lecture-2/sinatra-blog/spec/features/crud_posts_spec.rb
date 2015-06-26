require 'spec_helper'

describe "CRUD Posts", :js => true do

  context "The Homepage" do

    it 'links to the individual blog posts pages' do
      # We need blog posts
      @post = Post.create(:title => "Hello World")
      
      visit '/'
      expect(page).to have_link("Hello World")
    end

  end

  context 'A Post page' do
    it 'should have the content and title of a post' do
      @post = Post.create(:title => "Hello World", :content => "Hiiiii")

      visit "/posts/#{@post.id}"

      within "h1" do
        expect(page).to have_content(@post.title)
      end

      expect(page).to have_content(@post.content)
    end
  end
end