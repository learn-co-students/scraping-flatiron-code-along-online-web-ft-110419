require 'nokogiri'
require 'open-uri'

require_relative './course.rb'
class Scraper
  
#get_page uses Nokogiri to get the HTML from a web page
def get_page
  doc = Nokogiri::HTML(open("https://flatironschool.com/"))
end

 
def get_courses
  self.get_page.css(".post")
  end

  def make_courses
    self.make_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css("p").text
    end
  end

  def print_corses
    self.make_coursesCourse.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "Schedule: #{course.schduel}"
        puts "Description : #{course.description}"
      end
    end
  end
end
