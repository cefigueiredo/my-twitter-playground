require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.from_omniauth' do
    let!(:twitter_user) do
      User.create(
        uid: '001',
        provider: 'twitter',
        nickname: 'fake_user'
      )
    end

    it 'fetches an existing user' do
      expect(User.from_omniauth(uid: '001')).to eq twitter_user
    end

    it 'creates a user if it does not exist' do
      user = User.from_omniauth({
        uid: '123' ,
        info: {
          nickname: 'test',
          name: 'User test',
          email: 'user@test.com',
          image: 'user.jpg'
        }
      })

      expect(user).to be_persisted
      expect(user.name).to eq 'User test'
      expect(user.provider).to eq 'twitter'
      expect(user.nickname).to eq 'test'
      expect(user.email).to eq 'user@test.com'
      expect(user.image).to eq 'user.jpg'
    end
  end
end
