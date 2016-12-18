class RedRead::CLI

  BASE_URL = "https://www.reddit.com"

  def call
    start
  end

  def make_reddits(subreddit_url)
    reddits_array = Scraper.scrape_subreddit_page(subreddit_url)
    Reddit.create_from_collection(reddits_array)
  end

  def add_attributes_to_reddit(reddit)
    attributes_hash = Scraper.scrape_reddit_page(reddit.url)
    reddit.add_reddit_attributes(attributes_hash)
  end

  def display_reddits
    Reddit.all.each.with_index(1) do |reddit, i|
      puts "#{i}. #{reddit.title}"
    end
  end

  def display_reddit_attributes(reddit)
    puts "#{reddit.title}"
    puts "#{reddit.description}"
    puts ""
    puts "Top Comment: #{reddit.top_comment}"
  end

  def start
    puts "Reddit Reader"
    subreddit_url = BASE_URL + "/r/" + "mildlyinteresting"
    make_reddits(subreddit_url)
    display_reddits
    input = nil
    while input != "exit"
      puts ""
      puts "What reddit would you more information on, by number?"
      puts ""
      puts "Enter list to see the reddits again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        display_reddits
      elsif input.to_i > 0
        if reddit = Reddit.all[input.to_i - 1]
          add_attributes_to_reddit(reddit)
          display_reddit_attributes(reddit)
        end
      end
    end
    puts "Goodbye!!!"
  end

end
