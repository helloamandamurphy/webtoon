#require_relative './comics.rb'

class Webtoon::Scraper

  def self.genre_scraper #collects url for genre selection
    by_genre = {}
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))
    genre_links = doc.css("div.left_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}
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
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))
    target_links = doc.css("div.right_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}#.each do |link|
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

  def self.scrape_by_genre #scrapes top 10 comics by genre
    genre_comics = []
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top")) #eventually pull this source through genre_links
    doc.css("div.left_area ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        genre_comics << {title: title, author: author, comic_url: url}
      end
    end
    puts genre_comics
  end

  def self.scrape_by_target #scrapes top 10 comics by target readers
    target_comics = []

    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top")) #eventually pull this source through target_links
    doc.css("div.right_area ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        target_comics << {title: title, author: author, comic_url: url}
      end
    end
    puts target_comics
  end

  def self.scrape_page
    comic = {}

    doc = Nokogiri::HTML(open(comic_url))
      comic[:title] = doc.css("div.info h1").text
      comic[:author] = doc.css("div.info a").children.first.text
      comic[:genre] = doc.css("div.info h2").text
      comic[:description] = doc.css("p.summary").text
      comic[:rating] = doc.css("em.cnt").text
      comic[:url] = comic_url

    comic
  end
end
