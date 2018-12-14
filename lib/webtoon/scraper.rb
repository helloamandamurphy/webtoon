#require_relative './comics.rb'

class Webtoon::Scraper
  def self.scrape_top_ten
    comics = []
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))
    doc.css("ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        comics << {title: title, author: author, comic_url: url}
      end
    end
    puts comics
  end

  def self.scraper
    genre_links = []
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))
    links = doc.css("div.left_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}.each do |link|
      genre_links << link.split("&")[0]
    end
    genre_names = doc.css("div.left_area ul.ranking_tab").children.css("a span").collect {|el| el.text.strip}
    puts genre_links
    puts genre_names
  end

  #def self.by_genre_all
    #scrape_top_ten
  #end
end
#What's the difference between hashes and arrays as far as storing all the things?
