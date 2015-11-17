require 'rails_helper'

RSpec.describe TweetsHelper, type: :helper do
  describe "#tweet_with_mentions" do
    it "add links to mentioned users on tweets" do
      tweet = "I am @twitter_user"
      tweet_with_mention = "I am <a href=\"/tweets?handle=twitter_user\">@twitter_user</a>"

      expect(helper.tweet_with_mentions(tweet)).to eq tweet_with_mention
    end
  end
end
