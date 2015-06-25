class SiteGenerator

  def initialize
  end

  def call
    # 1. It will have to generate index.html in _site that contains a link to
    # every blog post
    # 2. It will ahve to generate a post_1.html in _site/posts for every blog post
    # with the content of that blog post.
    generate_index
    generate_show
  end

  def generate_show
    # 1. read the source of the template   
    html = File.read("app/views/show.html.erb")
    # 2. make it into an ERB instance
    template = ERB.new(html)
    # 3. load some local data required by the template
    posts = Post.all

    posts.each do |post|
      src = template.result(binding)
      File.write("_site/posts/#{post.id}.html", src)
    end
  end

  def generate_index
    erb :index
    
    # 1. read the source of the template   
    html = File.read("app/views/index.html.erb")
    # 2. make it into an ERB instance
    template = ERB.new(html)
    # 3. load some local data required by the template
    posts = Post.all

    # 4. render the templates content
    src = template.result(binding)

    # 5. write to file system
    File.write("_site/index.html", src)
  end

end