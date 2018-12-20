class Webtoon::Comic

  attr_accessor :title, :author, :genre, :description, :rating, :url

  @@all = []

  def initialize(top_ten_hash)
    top_ten_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

   #genre=nil, description=nil, rating=nil,

end
