class StudentCLI

  def initialize(site)
    @site = site
    @students = StudentScraper.new(@site).call
  end

  # Interface
  def index
    @students.keys.each.with_index(1){|n,i| puts "#{i}. #{n}"}
  end

  # Interface
  def show_student(student)
    [:name, :github, :linkedin, :twitter, :rss].each do |attribute|
      puts "#{attribute.to_s.capitalize}: #{student.send(attribute)}"
    end
  end

  def call
    # Procedure / Interface
    input = nil
    while input != "exit"
      puts "Please enter your command:"
      input = gets.strip
      case input
      when "index"
        index
      when "show"
        puts "Which student do you want to see?"
        name = gets.strip # "Avi Flombaum"
        
        student = Student.find_by_name(name)

        url = @students[name]

        student = Student.new(url, @site)
        
        show_student(student)
      end
    end
  end

end


