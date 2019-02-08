require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user_attrs) { attributes_for(:user) }
  let(:wrong_user_attrs) { attributes_for(:wrong_user) }

  describe 'POST #create' do

    it 'register new user' do
      params = { nickname: user_attrs[:nickname], email: user_attrs[:email], password: user_attrs[:password] }
      post :register, params: params

      expect(response).to have_http_status(:success)
    end

    it 'register already added user' do
      params = { nickname: wrong_user_attrs[:nickname], email: wrong_user_attrs[:email], password: wrong_user_attrs[:password] }
      post :register, params: params

      expect(response).to have_http_status(422)
    end

  end
end
