require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  def get_page 
    page = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    page = Nokogiri::HTML(page)

  end
  
  def get_courses
    course_info = self.get_page.css("#course-grid .post")
  end 
  
  def make_courses
    course_info = self.get_courses
    course_info = course_info.slice(0..6)
    course_info.each_with_index do |course, index|
      course = Course.new()
      course.description = course_info[index].css("p").text
      course.title = course_info[index].css("h2").text
      course.schedule = course_info[index].css("date").text
    end 
  end

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
  
end

Scraper.new.get_page

