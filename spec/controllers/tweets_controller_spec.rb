require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    context "when user is authenticated" do
      let(:user) { double('user', uid: '22', nickname: 'user22') }

      before(:each) do
        sign_in user
      end

      it { expect(subject).to be_success }
      it { expect(subject).to have_http_status(200) }

      context "and give the desired user by 'handle' query_string" do
        it "shows the given user's tweets" do
          get :index, handle: 'existent-user'
          expect(response).to render_template 'tweets/index'
        end

        it "shows user_not_found template when user can not be found" do
          get :index, handle: 'not-existent'
          expect(response).to render_template 'tweets/user_not_found'
        end

        it "shows unauthorized template when user account is private" do
          get :index, handle: 'private-account'
          expect(response).to render_template 'tweets/unauthorized'
        end
      end
    end

    context "when user is not authenticated" do
      it { expect(subject).to redirect_to new_user_session_path }
    end
  end
end
