#require_relative './comics.rb'

class Webtoon::Scraper

  def self.scrape_by_genre(url) #scrapes top 10 comics by genre
    genre_comics = []
    doc = Nokogiri::HTML(open(url))
    doc.css("div.left_area ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        genre_comics << {title: title, author: author, comic_url: url}
      end
    end
    genre_comics
  end

  def self.scrape_by_target(url) #scrapes top 10 comics by target readers
    target_comics = []

    doc = Nokogiri::HTML(open(url)) #eventually pull this source through target_links
    doc.css("div.right_area ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        target_comics << {title: title, author: author, comic_url: url}
      end
    end
    target_comics
  end

  def self.scrape_page(url)
    comic = {}

    doc = Nokogiri::HTML(open(url))
      comic[:title] = doc.css("div.info h1").text
      comic[:author] = doc.css("div.info a").children.first.text
      comic[:genre] = doc.css("div.info h2").text
      comic[:description] = doc.css("p.summary").text
      comic[:rating] = doc.css("em.cnt").text
      comic[:url] = url

    comic
  end
end
