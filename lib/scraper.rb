
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper 
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses
    doc = get_page
    courses = doc.css('#course-grid > section > article')
  end 
 
  def make_courses
    courses = get_courses
        courses.map do |course|
          title = course.css("h2").text
          schedule = course.css("em").text
          description = course.css("p").text
        end
  end
  
  
end



