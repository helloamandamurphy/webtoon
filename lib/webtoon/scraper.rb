class Webtoon::Scraper

  def self.scrape_by_genre(url)
    genre_comics = []
    doc = Nokogiri::HTML(open(url))
    doc.css("div.left_area ul.lst_type1 li").each do |container|
      comic_url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        genre_comics << {title: title, author: author, comic_url: comic_url}
      end
    end
    genre_comics
  end

  def self.scrape_by_target(url)
    target_comics = []

    doc = Nokogiri::HTML(open(url))
    doc.css("div.right_area ul.lst_type1 li").each do |container|
      comic_url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        target_comics << {title: title, author: author, comic_url: comic_url}
      end
    end
    target_comics
  end

  def self.scrape_page(url)
    comic = {}

    doc = Nokogiri::HTML(open(url))
      comic[:genre] = doc.css("div.info h2").text
      comic[:description] = doc.css("p.summary").text
      comic[:rating] = doc.css("em.cnt").text
    comic
  end
end
