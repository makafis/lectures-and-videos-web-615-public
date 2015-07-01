require 'spec_helper'

describe "/posts", :js => true do

  context "INDEX" do

    it 'links to the individual blog posts pages' do
      # We need blog posts
      @post = Post.create(:title => "Hello World")
      
      visit '/'
      expect(page).to have_link("Hello World")
    end
  end

  context 'SHOW' do
    it 'should have the content and title of a post' do
      @post = Post.create(:title => "Hello World", :content => "Hiiiii")

      visit "/posts/#{@post.id}"

      within "h1" do
        expect(page).to have_content(@post.title)
      end

      expect(page).to have_content(@post.content)
    end
  end

  context 'NEW' do
    it 'renders a form to create a new post' do
      visit '/posts/new'

      expect(page).to have_selector("form[action='/posts']")
      expect(page).to have_field("author_name")
    end
  end

  context 'CREATE' do
    it 'submits the form to DB after submission' do
      visit '/posts/new'
      fill_in 'post[title]', :with => "Hello World"
      click_button "submit"

      expect(Post.find_by(:title => "Hello World")).to_not be_nil
      expect(page).to have_content("Hello World")
    end
  end

  context 'EDIT' do

    it 'renders a form to edit a post' do
      @post = Post.create(:title => "TEST THIS POST")

      visit "/posts/#{@post.id}/edit"

      expect(page).to have_selector("form[action='/posts/#{@post.id}']")
      
      input_method_field = find("input[name='_method']", :visible => false)
      expect(input_method_field.value).to eq("PUT")
      
      within "form" do
        expect(page).to have_field("post[title]", :with => @post.title)
        expect(page).to have_field("post[content]", :with => @post.content)
      end
    end

  end

  context 'UPDATE' do
    # Load the edit form
    # we need to fill it in with new values
    # and then we need to check if the show page or somehow the DB
    # was updated

  end


end