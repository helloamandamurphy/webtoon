#Previously in Scraper class

@doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))

def self.genre_scraper #collects url for genre selection
  by_genre = {}
  genre_links = @doc.css("div.left_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}
  #genre_names = doc.css("div.left_area ul.ranking_tab").children.css("a span").collect {|el| el.text.strip}

  genre_links.each do |link|
    link.downcase!
    if link.include? "all"
      by_genre[:all] = link
    elsif link.include? "action"
      by_genre[:action_fantasy] = link
    elsif link.include? "romance"
      by_genre[:romance_drama] = link
    elsif link.include? "comedy"
      by_genre[:comedy] = link
    elsif link.include? "slice of life"
      by_genre[:slice_of_life] = link
    elsif link.include? "others"
      by_genre[:others] = link
    end
  end
  by_genre
end

def self.target_scraper #collects url for target selection
  by_target = {}
  target_links = @doc.css("div.right_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}#.each do |link|
  #target_names = doc.css("div.right_area ul.ranking_tab").children.css("a span").collect {|el| el.text.strip}

  target_links.each do |link|
    link.downcase!
    if link.include? "male10"
      by_target[:male10] = link
    elsif link.include? "female10"
      by_target[:female10] = link
    elsif link.include? "male20"
      by_target[:male20] = link
    elsif link.include? "female20"
      by_target[:female20] = link
    elsif link.include? "male30"
      by_target[:male30] = link
    elsif link.include? "female30"
      by_target[:female30] = link
    end
  end
  by_target
end

#From CLI
def get_genre_url(genre)
  by_genre = Webtoon::Scraper.genre_scraper
  by_genre.each do |attribute, value|
    if attribute == genre
      value
    end
  end
end

def get_target_url(target)
  by_target = Webtoon::Scraper.target_scraper
  by_target.each do |attribute, value|
    if attribute == target
      value
    end
  end
end
