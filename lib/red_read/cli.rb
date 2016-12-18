class RedRead::CLI

  BASE_URL = "https://www.reddit.com"

  def call
    puts "Reddit Reader"
    subreddit_url = BASE_URL + "/r/" + "woahdude"
    reddit = make_reddits(subreddit_url)
    add_attributes_to_reddit(reddit)
    binding.pry
  end

  def make_reddits(subreddit_url)
    reddits_array = Scraper.scrape_subreddit_page(subreddit_url)
    Reddit.create_from_collection(reddits_array)
    Reddit.all[0]
  end

  def add_attributes_to_reddit(reddit)
    attributes_hash = Scraper.scrape_reddit_page(reddit.url)
    reddit.add_reddit_attributes(attributes_hash)
  end

end
