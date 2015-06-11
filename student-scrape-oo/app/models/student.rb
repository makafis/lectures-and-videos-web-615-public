class Student

  def initialize(path, site = "http://web0615.students.flatironschool.com/")
    @site = site
    @path = path
    load_doc
  end

  def load_doc
    student_html = open("#{@site}#{@path}").read
    @doc = Nokogiri::HTML(student_html)
  end

  def name
    @name = @doc.search("h4.ib_main_header").text
  end

  def quote
    @quote = @doc.search("li div.textwidget h3").text
  end

  def github
    @github = @doc.search("i.icon-github").first.parent.attr("href")
  end

  def twitter
    @twitter = @doc.search("i.icon-twitter").first.parent.attr("href")
  end

  def rss
    @rss = @doc.search("i.icon-rss").first.parent.attr("href")
  end

  def linkedin
    @linkedin = @doc.search("i.icon-linkedin-sign").first.parent.attr("href")
  end
end