require 'ostruct'

module TwitterIntegration
  module_function
  def client
    FakeTimeLine.new
  end
end

class FakeTimeLine
  def user_timeline(user, *args)
    fail Twitter::Error::NotFound if user == 'not-existent'
    [FakeTweet.new]
  end

  def user(user)
    fail Twitter::Error::NotFound if user == 'not-existent'
    FakeUser.new
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

class FakeUser
  def profile_image_url
    'nice_picture.png'
  end

  def screen_name
    'fake_user'
  end
end
