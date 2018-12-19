class Webtoon::Comic

  attr_accessor :title, :author, :genre, :description, :rating, :url

  @@all = []

  def initialize(title=nil, author=nil, genre=nil, description=nil, rating=nil, url=nil)
    @title = title
    @author = author
    @genre = genre
    @description = description
    @rating = rating
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
