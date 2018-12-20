class Webtoon::CLI

@@all = "https://www.webtoons.com/en/top"
@@action = "https://www.webtoons.com/en/top?rankingGenre=ACTION_FANTASY"
@@romance = "https://www.webtoons.com/en/top?rankingGenre=ROMANCE_DRAMA"
@@comedy = "https://www.webtoons.com/en/top?rankingGenre=COMEDY"
@@slice = "https://www.webtoons.com/en/top?rankingGenre=SLICE_OF_LIFE"
@@others = "https://www.webtoons.com/en/top?rankingGenre=OTHERS"

@@m10 = "https://www.webtoons.com/en/top?target=MALE10"
@@f10 = "https://www.webtoons.com/en/top?target=FEMALE10"
@@m20 = "https://www.webtoons.com/en/top?target=MALE20"
@@f20 = "https://www.webtoons.com/en/top?target=FEMALE20"
@@m30 = "https://www.webtoons.com/en/top?target=MALE30"
@@f30 = "https://www.webtoons.com/en/top?target=FEMALE30"


  def call
    puts "Welcome Webtooner!"
    start
  end

  def start
    puts ""
    puts "MAIN MENU"
    puts ""
    puts "What would you like to view? Your options are as follows:"
    puts ""
    puts "Enter 1 to view top ten comics overall."
    puts "Enter 2 to view top ten comics by genre."
    puts "Enter 3 to view top ten comics by age and gender."
    puts "Enter 4 to exit the program."

    menu_input = gets.strip.to_i

    if menu_input == 1
      puts ""
      puts "-----------Top Ten Comics-----------"
      run_genre(@@all)
    elsif menu_input == 2
      genre_options
    elsif menu_input == 3
      target_options
    elsif menu_input == 4
      exit_program
    else
     call #prompts user with Main Menu options when user input is invalid
    end
 end

  def exit_program
    puts "Thanks for using Webtoon. See you next time."
    exit
  end

  def genre_options
    puts ""
    puts "Select your genre. Your options are as follows:"
    puts ""
    puts "Enter 1 to view top ten Action / Fantasy comics."
    puts "Enter 2 to view top ten Romance / Drama comics."
    puts "Enter 3 to view top ten Comedy comics."
    puts "Enter 4 to view top ten Slice of Life comics."
    puts "Enter 5 to view top ten other genre comics."
    puts "Enter 6 to return to the Main Menu."

    genre_input = gets.strip.to_i

    if genre_input == 1
      puts ""
      puts "-------Top Ten Action / Fantasy comics-------"
      run_genre(@@action)
    elsif genre_input == 2
      puts ""
      puts "-------Top Ten Romance / Drama comics-------"
      run_genre(@@romance)
    elsif genre_input == 3
      puts ""
      puts "------------Top Ten Comedy comics-----------"
      run_genre(@@comedy)
    elsif genre_input == 4
      puts ""
      puts "--------Top Ten Slice of Life comics--------"
      run_genre(@@slice)
    elsif genre_input == 5
      puts ""
      puts "------------Top Ten Other comics------------"
      run_genre(@@other)
    elsif genre_input == 6
      start
    else
      genre_options
    end
  end

  def target_options
    puts ""
    puts "Select your desired age and gender combination."
    puts "Your options are as follows:"
    puts ""
    puts "Enter 1 to view top ten comics for males ages 10-19."
    puts "Enter 2 to view top ten comics for females ages 10-19."
    puts "Enter 3 to view top ten comics for males ages 20-29."
    puts "Enter 4 to view top ten comics for females ages 20-29."
    puts "Enter 5 to view top ten comics for males ages 30-39."
    puts "Enter 6 to view top ten comics for females ages 30-39."
    puts "Enter 7 to return to the Main Menu."

    target_input = gets.strip.to_i

    if target_input == 1
      puts ""
      puts "---Top Ten Comics of Males Ages 10-19---"
      run_genre(@@m10)
    elsif target_input == 2
      puts ""
      puts "---Top Ten Comics of Females Ages 10-19---"
      run_genre(@@f10)
    elsif target_input == 3
      puts ""
      puts "---Top Ten Comics of Males Ages 20-29---"
      run_genre(@@m20)
    elsif target_input == 4
      puts ""
      puts "---Top Ten Comics of Females Ages 20-29---"
      run_genre(@@f20)
    elsif target_input == 5
      puts ""
      puts "---Top Ten Comics of Males Ages 30-39---"
      run_genre(@@m30)
    elsif target_input == 6
      puts ""
      puts "---Top Ten Comics of Females Ages 30-39---"
      run_genre(@@f30)
    elsif target_input == 7
      start
    else
      target_options
    end
  end

  def comic_details
    puts ""
    puts "--------------------------------------------"
    puts ""
    puts "If you would like to learn more about a comic on this list, enter its rank."
    puts "If you would like to return to the Main Menu, enter 0."

    comic_selection = gets.strip.to_i

      if comic_selection.between?(1,10)
        puts "Comic details"
      elsif comic_selection == 0
        start
      else
        comic_details
      end
      #get comic_selection to retrieve the page_url for the comic with the rank equal to comic_selection and print details
  end

  def make_genre_list(url)
    genre_comics = Webtoon::Scraper.scrape_by_genre(url)
    Webtoon::Comic.create_from_array(genre_comics)
  end

  def make_target_list(url)
    target_comics = Webtoon::Scraper.scrape_by_target
    create_from_array(target_comics)
  end

  def add_details_to_comics
    Webtoon::Comic.all.each do |comic|
      details = Webtoon::Scraper.add_comic_details(comic.url)
      comic.add_comic_details(details)
    end
  end

  def run_genre(url)
    Webtoon::Comic.clear_all
    make_genre_list(url)
    print_comics
    comic_details
  end

  def run_target(url)
    Webtoon::Comic.clear_all
    make_target_list(url)
    print_comics
    comic_details
  end

  def print_comic(comic)
    puts ""
    puts "----------- #{comic.name} -----------"
    puts ""
    puts "Author:             #{comic.artist}"
    puts "Genre:              #{comic.genre}"
    puts "Rating:             #{comic.rating}"
    puts ""
    puts "Description:"
    puts "#{comic.description}"
    puts "Website:            #{comic.comic_url}"
    puts ""
  end

  def print_comics
    puts ""
    Webtoon::Comic.all.each.with_index(1) do |comic, index|
      puts "#{index}. #{comic.title} by #{comic.author}"
    end
  end
end
