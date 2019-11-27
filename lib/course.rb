class Course

  @@all = []


  attr_accessor :title, :description, :schedule


  def initialize
    @@all << self
  end


  def self.all
    @@all
  end
    

  def self.reset_all
    @@all.clear
  end


end

