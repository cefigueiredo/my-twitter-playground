class TweetsController < ApplicationController
  rescue_from Twitter::Error::NotFound, with: :user_not_found

  def index
    @nickname = params[:handle] || current_user.nickname
    @tweets = find_tweets_for @nickname
  end

  private
  def user_not_found
    render :user_not_found
  end

  def find_tweets_for(nickname)
    cache ['tweets', nickname], expires_in: 5.minutes do
      TwitterIntegration.client.user_timeline(nickname, count: 25)
    end
  end
end
