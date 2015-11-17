class TweetsController < ApplicationController
  def index
    @tweets = TwitterIntegration.client.user_timeline('cefigueiredo',
      count: 25
    )
  end
end
