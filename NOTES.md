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

Scraper class--Okay, we got this.
-Let's try not scraping the URL's for the different genres/targets (hard code them.)
-Scraper class needs to have three methods
  1) scrape_by_genre(url) -scrapes top ten comics by selected genre
  2) scrape_by_target(url) -scrapes top ten comics by selected target
  3) scrape_page(comic_url) -scrapes details off comic page

Comic Class
-In Student Scraper lab, this class has the following methods:
  1) initialize(student_hash)
  2) self.create_from_collection(students_array)
  3) add_student_attributes(attributes hash)
  4) self.all

CLI
I need to focus on adding functional methods to my CLI instead of user facing text. (That's already there.)
In the Student Scraper lab, there are the following methods:
1) run (make students, add attributes, display students)
2) make_students --students array = index scraper, and then uses create_from_collection, and passes student array through it.
3) Add attributes to students
