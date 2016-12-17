class RedRead::CLI

  def call
    puts "Reddit Reader"
    puts Scraper.scrape_subreddit_page("https://www.reddit.com/r/Guitar/")
  end

end
