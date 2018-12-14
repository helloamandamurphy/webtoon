#require_relative './comics.rb'

class Webtoon::Scraper

  def self.genre_scraper
    by_genre = {}
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))
    links = doc.css("div.left_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}.each do |link|
      genre_links << link.split("&")[0]
    end
    genre_names = doc.css("div.left_area ul.ranking_tab").children.css("a span").collect {|el| el.text.strip}

    #puts genre_links
    #puts genre_names
  end

  def self.target_scraper
    by_target = {}
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top"))
    target_links = doc.css("div.right_area ul.ranking_tab").children.css("a").collect {|el| el.attr("href")}#.each do |link|
      #target_links << link.split("&")[0]
    #end
    target_names = doc.css("div.right_area ul.ranking_tab").children.css("a span").collect {|el| el.text.strip}

    #puts target_links #(includes genre part of links)
    #puts target_names #(Lacks necessary spaces between words)
  end

  def self.scrape_by_genre #scrapes top 10 comics by genre
    comics = []
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top")) #eventually pull this source through genre_links
    doc.css("div.left_area ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        comics << {title: title, author: author, comic_url: url}
      end
    end
    puts comics
  end

  def self.scrape_by_target #scrapes top 10 comics by target readers
    comics = []
    doc = Nokogiri::HTML(open("https://www.webtoons.com/en/top")) #eventually pull this source through target_links
    doc.css("div.right_area ul.lst_type1 li").each do |container|
      url = container.css("a").attr("href").value
      container.css("a div.info_area").each do |info|
        title = info.css("p.subj").text
        author = info.css("p.author").text
        comics << {title: title, author: author, comic_url: url}
      end
    end
    puts comics
  end
end


#1) Scrape top 10 comics for each genre.
#2) Scrape top 10 comics for each age/gender.
#3) Scrape details from individual url.

#Nested Data Structure
#all comics = {
  #by_genre = {}
    #all = [
      #{rank1}, {rank2,} {rank3}
    #]
  #by_age_gender = {}
#top10comics = [{rank, title, author}, {rank, title, author}, {etc.}]

#comic = {
  #title
  #author
  #genre
  #description
  #rating
#}
