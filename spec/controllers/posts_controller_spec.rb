require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:user_attrs) { attributes_for(:user) }
  let!(:user) { create(:user) }

  before do
    @auth_token = AuthenticateUser.call(user_attrs[:email], user_attrs[:password]).result
  end

  describe 'GET #index' do
    it 'should take all posts' do
      @request.headers['Authorization'] = @auth_token
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'missing token error' do
      get :index
      expect(response.body).to match(/"error":"Not Authorized"/)
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
