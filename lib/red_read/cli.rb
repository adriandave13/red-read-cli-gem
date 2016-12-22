class RedRead::CLI

  BASE_URL = "https://www.reddit.com"

  def call
    start
  end

  def make_reddits(subreddit_url)
    reddits_array = Scraper.scrape_subreddit_page(subreddit_url)
    Reddit.create_from_collection(reddits_array)
  end

  def display_reddits
    Reddit.all.each.with_index(1) do |reddit, i|
      puts "#{i}. ".colorize(:light_blue) + "#{reddit.title}"
    end
  end

  def add_attributes_to_reddit(reddit)
    attributes_hash = Scraper.scrape_reddit_page(reddit.url)
    reddit.add_reddit_attributes(attributes_hash)
  end

  def display_reddit_attributes(reddit)
    puts "--------------------------------------------------".colorize(:blue)
    puts "Title: ".colorize(:light_blue) + "#{reddit.title}"
    puts ""
    puts "Description: ".colorize(:light_blue) + " #{reddit.description}"
    puts ""
    puts "Top Comment: ".colorize(:light_blue) + "#{reddit.top_comment}"
    puts ""
    puts "URL: ".colorize(:light_blue) + "#{reddit.url}"
    puts "--------------------------------------------------".colorize(:blue)
  end

  def get_subreddit
    Reddit.delete_all
    while Reddit.all.empty?
      puts "Enter a subreddit:"
      subreddit_input = gets.strip
      puts ""
      subreddit_url = BASE_URL + "/r/" + subreddit_input
      make_reddits(subreddit_url)
    end
    display_reddits
  end

  def start
    puts "Reddit Reader"
    get_subreddit
    input = nil
    while input != "exit"
      puts ""
      puts "What reddit would you more information on, by number?"
      puts ""
      puts "Enter list to see the reddits again."
      puts "Enter new to enter another subreddit."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      puts ""
      if input == "list"
        display_reddits
      elsif input == "new"
        get_subreddit
      elsif input.to_i > 0
        if reddit = Reddit.all[input.to_i - 1]
          add_attributes_to_reddit(reddit)
          display_reddit_attributes(reddit)
        end
      end
    end
    puts "Goodbye!"
  end

end
