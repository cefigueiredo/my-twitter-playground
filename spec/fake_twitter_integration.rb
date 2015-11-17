require 'ostruct'

module TwitterIntegration
  module_function
  def client
    FakeTimeLine.new
  end
end

class FakeTimeLine
  def user_timeline(user, *args)
    [FakeTweet.new]
  end
end

class FakeTweet
  def text
    'Fancy tweet'
  end

  def created_at
    DateTime.now
  end
end
