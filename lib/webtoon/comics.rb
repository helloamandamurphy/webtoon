class Webtoon::Comic

  attr_accessor :title, :author, :genre, :description, :rating, :comic_url

  @@all = []

  def initialize(comic_hash)
    comic_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_array(list_array)
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

  def self.find(input)
    Webtoon::CLI.add_details_to_comics
    print_comic(self.all[input-1])
  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input-1]
  end

  def self.clear_all
    @@all.clear
    @@all
  end
end
