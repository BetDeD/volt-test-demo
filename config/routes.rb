Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :posts, only: [:create, :show, :index]
      get '/posts/:id/comments', to: 'posts#comments'
      post '/posts/:id/comments', to: 'posts#create_comment'
      resources :comments, only: [:create, :show, :index]
    end
  end

  post 'register', to: 'users#register'
  post 'authenticate', to: 'users#authenticate'

end
