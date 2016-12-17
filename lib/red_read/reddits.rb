class Scraper

  def self.scrape_subreddit_page(subreddit_url)
    index_page = Nokogiri::HTML(open(subreddit_url))
    reddits = []
    index_page.css("div.entry").each do |reddit|
        reddit_title = reddit.css('a.title').text
        reddit_url = reddit.css('a.title').attr('href').value
        reddits << {title: reddit_title, url: reddit_url}
    end
    reddits
  end

end
