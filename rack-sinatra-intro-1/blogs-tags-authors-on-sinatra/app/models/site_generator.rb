class SiteGenerator

  def call
    build_index
    build_show
    build_author_show
  end

  def build_author_show
    # Setup Some Data
    @authors = Author.all

    # Read the template
    template_html = File.read("app/views/authors/show.html.erb")
    # Load the template
    template = ERB.new(template_html)

    @authors.each do |author|
      # Setup the file
      show_file = File.open("_site/authors/#{author.id}.html", 'w+')
      
      @author = author
      # Compile the template
      html = template.result(binding)

      # Write the result
      show_file.write(html) 
    end   
  end

  def build_show
    # Setup Some Data
    @posts = Post.all

    # Read the template
    template_html = File.read("app/views/show.html.erb")
    # Load the template
    template = ERB.new(template_html)

    @posts.each do |post|
      # Setup the file
      show_file = File.open("_site/posts/#{post.id}.html", 'w+')
      
      @post = post
      # Compile the template
      html = template.result(binding)

      # Write the result
      show_file.write(html)
    end
    # There should be 35 files in /posts

  end

  def build_index
    # Setup Some Data
    @posts = Post.all

    # Setup the file
    @index_file = File.open("_site/index.html", 'w+')

    # Read the template
    template_html = File.read("app/views/index.html.erb")
    # Load the template
    template = ERB.new(template_html)
    # Compile the template
    html = template.result(binding)

    # Write the result
    @index_file.write(html)
  end

end