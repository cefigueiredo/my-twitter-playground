module TweetsHelper
  NICKNAME_REGEX = /(?<=^|(?<=[^a-zA-Z0-9\-_\.]))(@[A-Za-z0-9_]+)/
  HANDLE_REGEX = /@([A-Za-z0-9_]+)/

  def tweet_with_mentions(tweet)
    tweet.scan(NICKNAME_REGEX).flatten.each do |mention|
      tweet = tweet.gsub(mention, user_link(mention))
    end

    tweet.html_safe
  end

  private
  def user_link(mention)
    nickname = mention.scan(HANDLE_REGEX).flatten.first

    link_to(mention, tweets_path(handle: nickname))
  end
end
