class TweetsController < ApplicationController
  rescue_from Twitter::Error::NotFound, with: :user_not_found
  rescue_from Twitter::Error::Unauthorized, with: :unauthorized

  def index
    @nickname = params[:handle] || current_user.nickname
    @twitter_profile = find_user_profile @nickname
    @tweets = find_tweets_for @nickname
  end

  private
  def user_not_found
    render :user_not_found
  end

  def unauthorized
    render :unauthorized
  end

  def find_user_profile(nickname)
    cache ['user_profile', nickname], expires_in: 30.minutes do
      TwitterIntegration.client.user(nickname)
    end
  end

  def find_tweets_for(nickname)
    cache ['tweets', nickname], expires_in: 5.minutes do
      TwitterIntegration.client.user_timeline(nickname, count: 25)
    end
  end
end
