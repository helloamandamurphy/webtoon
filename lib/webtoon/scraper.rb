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
        by_genre[:slice_of_life]
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


#3) Scrape details from individual url.

#Nested Data Structure
#all comics = {
  #by_genre = {}
    #all = [
      #{rank1}, {rank2,} {rank3}
    #]
  #by_target = {}
#top10comics = [{rank, title, author}, {rank, title, author}, {etc.}]

#comic = {
  #title
  #author
  #genre
  #description
  #rating
#}
