class Webtoon::CLI

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
      puts "Top 10 Comics"
    elsif menu_input == 2
      genre_options
    elsif menu_input == 3
      puts "Target options"
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
      puts "Top Ten Action / Fantasy comics" #input needs to select use key to retrieve url, then pass through genre scraper, then print list.
    elsif genre_input == 2
      puts "Top Ten Romance / Drama comics"
    elsif genre_input == 3
      puts "Top Ten Comedy comics"
    elsif genre_input == 4
      puts "Top Ten Slice of Life comics"
    elsif genre_input == 5
      puts "Top Ten other genre comics"
    elsif genre_input == 6
      start
    else
      genre_options
    end
  end

  def target_options
    puts ""
    puts "Select your desired age and gender combination."
    puts " Your options are as follows:"
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
      puts "males 10s" #input needs to select use key to retrieve url, then pass through target scraper, then print list.
    elsif target_input == 2
      puts "females 10s"
    elsif target_input == 3
      puts "males 20s"
    elsif target_input == 4
      puts "females 20s"
    elsif target_input == 5
      puts "males 30s"
    elsif target_input == 6
      puts "female 30s"
    elsif target_input == 7
      start
    else
      target_options
    end

  end

  def comic_details #(argument of target_input or genre_input)
    #prints list
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
end
