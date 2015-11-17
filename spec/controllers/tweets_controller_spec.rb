require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  it "GET #index responds successfully" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

end
