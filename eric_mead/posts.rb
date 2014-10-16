require 'pry' 

class ActiveRecord
  def initialize
    @@objects ||= []
    @@objects << self
  end

  def self.all
    @@objects
  end

  def self.first
    @@objects.first
  end

  def self.last
    @@objects.last
  end
end

class Post < ActiveRecord
  attr_accessor :title

  def initialize(title)
    @title = title
    super()
  end
end

binding.pry


10.times do |n|
  Post.new("Title Number #{n}")
end

html = ''

Post.all.each do |post|
  html << "<h1>#{post.title}</h1>"
end

File.write('blog.html', html)
