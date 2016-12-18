class Scraper

  def self.scrape_subreddit_page(subreddit_url)
    index_page = Nokogiri::HTML(open(subreddit_url))
    reddits = []
    index_page.css("div.entry").each do |reddit|
        reddit_title = reddit.css('a.title').text
        reddit_url = reddit.css('li.first a').attr('href').value
        reddits << {title: reddit_title, url: reddit_url}
    end
    reddits
  end

  def self.scrape_reddit_page(reddit_url)
    posting = {}
    reddit_page = Nokogiri::HTML(open(reddit_url))
    posting['description'] = reddit_page.css("div.content div.usertext-body div.md")[0].text
    posting['top_comment'] = reddit_page.css("div.content div.usertext-body div.md")[1].text
    posting
  end

end
