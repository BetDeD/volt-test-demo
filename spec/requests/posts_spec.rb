require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user_attrs) { attributes_for(:user) }
  let!(:user) { create(:user) }

  before do
    @auth_token = AuthenticateUser.call(user_attrs[:email], user_attrs[:password]).result
  end

  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get '/api/v1/posts', headers: { 'Authorization' => @auth_token }
      expect(response).to have_http_status(200)
    end
  end
end
