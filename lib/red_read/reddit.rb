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

  def add_reddit_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end

  def self.all
    @@all
  end

  def self.delete_all
    @@all.each do |reddit|
      reddit = nil
    end
    @@all = []
  end

end
