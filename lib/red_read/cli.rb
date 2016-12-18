class RedRead::CLI

  def call
    puts "Reddit Reader"
    puts Scraper.scrape_subreddit_page("https://www.reddit.com/r/explainlikeimfive/")
    puts Scraper.scrape_reddit_page("https://www.reddit.com/r/explainlikeimfive/comments/5it511/eli5_if_an_atom_can_fit_between_my_pinched/?st=iwtkzs89&sh=46490fd4")
  end

end
