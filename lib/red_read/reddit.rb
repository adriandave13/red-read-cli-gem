class Reddit

  attr_accessor :title, :url, :description, :top_comment

  @@all = []

  def initialize(reddit_hash)
    reddit_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(reddits_array)
    reddits_array.each do |reddit_hash|
      Reddit.new(reddit_hash)
    end
  end

end
