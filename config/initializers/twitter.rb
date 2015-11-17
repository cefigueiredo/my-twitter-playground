module TwitterIntegration

  module_function
  def client
    @twitter_rest_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    end
  end
end
