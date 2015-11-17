class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'], provider: 'twitter')
    sign_in_and_redirect @user, event: :authentication
  end
end
