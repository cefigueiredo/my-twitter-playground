class User < ActiveRecord::Base
  devise :omniauthable

  def self.from_omniauth(params, *args)
    where(uid: params[:uid], provider: 'twitter').first_or_create do |user|
      user.assign_attributes(
        params[:info].slice(:name, :nickname, :image, :email).to_h
      )
    end
  end
end
