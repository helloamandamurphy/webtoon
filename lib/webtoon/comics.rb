class Webtoon::Comic

  attr_accessor :title, :author, :genre, :description, :rating, :comic_url

  @@all = []

  #def new_from_genre(url)
    #genre_comics_array = Webtoon::Scraper.scrape_by_genre(url)
  #end

  def initialize(comic_hash)
    comic_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_array(list_array) #list array from CLI that uses Scraper
    list_array.each do |comic_hash|
      Webtoon::Comic.new(comic_hash)
    end
  end

  def add_comic_details(details_hash)
    details_hash.each do |detail, value|
      self.send("#{detail}=", value)
    end
    self
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
    @@all
  end
end
