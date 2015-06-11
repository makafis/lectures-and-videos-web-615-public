require 'pry'
require 'nokogiri'
require 'open-uri'

# {"Avi Flombaum" => "aviflombaum.com", "Name" => "URL"}
def scrape_index
  html = open("http://web0615.students.flatironschool.com/").read
  doc = Nokogiri::HTML(html)
  student_elements = doc.search("div.big-comment h3 a")

  # students = {}

  # student_elements.each do |e|
  #   students[e.text] = e.attr("href")
  # end

  # students
  student_elements.each_with_object({}) do |e, hash| 
    hash[e.text] = e.attr("href")
  end  
end

def index(students)
  students.keys.each.with_index(1){|n,i| puts "#{i}. #{n}"}
end

def scrape_student(url)
  student_html = open("http://web0615.students.flatironschool.com/#{url}").read
  student_doc = Nokogiri::HTML(student_html)
  
  {}.tap do |s|
    s[:name] = student_doc.search("h4.ib_main_header").text
    s[:quote] = student_doc.search("li div.textwidget h3").text
    s[:github] = student_doc.search("i.icon-github").first.parent.attr("href")
    s[:twitter] = student_doc.search("i.icon-twitter").first.parent.attr("href")
    s[:rss] = student_doc.search("i.icon-rss").first.parent.attr("href")
    s[:linkedin] = student_doc.search("i.icon-linkedin-sign").first.parent.attr("href")
  end
end

def show_student(student)
  student.each do |property, value|
    puts "#{property.to_s.capitalize}: #{value}"
  end
end

students = scrape_index

input = nil
while input != "exit"
  puts "Please enter your command:"
  input = gets.strip
  case input
  when "index"
    index(students)
  when "show"
    puts "Which student do you want to see?"
    name = gets.strip # "Avi Flombaum"
    url = students[name]

    student = scrape_student(url)
    
    show_student(student)
  end
end

# Avi Flombaum
# Everyone's Name
#