class StudentScraper
  def initialize(url)
    @url = url
    load_doc
  end

  def load_doc
    html = open(@url).read
    @doc = Nokogiri::HTML(html)
  end

  def call
    student_elements = @doc.search("div.big-comment h3 a")

    # It'd be great to just like get actual students here.
    student_elements.each_with_object({}) do |e, hash| 
      hash[e.text] = e.attr("href")
    end  
  end
end