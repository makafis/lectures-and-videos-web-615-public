class SiteGenerator

  def call
    reset_dir
    generate_index
    generate_posts
  end

  def reset_dir
    FileUtils.rm_rf('_site')
    FileUtils.mkdir_p '_site/posts'
    # we need to delete the current _site directory
    # we need to make a new one
  end

  def generate_index
    @posts = Post.all
    
    html = File.read("app/views/posts/index.html.erb")
    template = ERB.new(html)

    # we need to generate the index
    File.write('_site/posts/index.html', template.result(binding))
  end

  def generate_posts
    html = File.read("app/views/posts/show.html.erb")
    template = ERB.new(html)

    @posts = Post.all
    @posts.each do |post|
      @post = post
      result = template.result(binding)
      File.write("_site/posts/#{@post.id}.html", result)
    end
  end

end