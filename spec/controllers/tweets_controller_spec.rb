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
    end

    context "when user is not authenticated" do
      it { expect(subject).to redirect_to new_user_session_path }
    end
  end
end
