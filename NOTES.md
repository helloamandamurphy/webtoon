Goals of CLI Gem

-Greet user
-Prompt user with top 10 options
-Return basic information on top 10 for selected category (rank, title, author)
-Ask user if they would like more information about a specific comic
-Provide detailed information on requested comic (title, author, genre, description, rating score?)
-Ask if they would like to return to the list or view a new category.
-When user is done, say thank you and goodbye to the user.

Data Structure
by_genre = {all genre urls}
by_target = {all target urls}
  Use key to select url to be used in scrape_by_genre/scrape_by_target
genre_comics = [{comic}, {comic}, {comic}], where comic = title, author, url
genre_comics = [{comic}, {comic}, {comic}], where comic = title, author, url
  Use key to select url to be used in scrape_page method

Okay, okay, how do we get this scraped data into our program?

What should each class do?

Scraper class
-Let's try not scraping the URL's for the different genres/targets (hard code them.)
-Scraper class needs to have three methods
  1) scrape_by_genre(url) -scrapes top ten comics by selected genre
  2) scrape_by_target(url) -scrapes top ten comics by selected target
  3) scrape_page(comic_url) -scrapes details off comic page
