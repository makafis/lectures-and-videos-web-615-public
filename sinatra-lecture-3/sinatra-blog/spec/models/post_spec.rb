require 'spec_helper'

describe Post do 

  it 'can be saved to the database' do
    subject.save

    expect(Post.find(subject.id)).to eq(subject)
  end

  it 'can slugify the title' do
    subject.title = "Hello World"
    
    expect(subject.to_slug).to eq("hello-world")
  end
end