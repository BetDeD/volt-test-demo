Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :posts, only: [:create, :show, :index]
      resources :comments, only: [:create, :show, :index]
    end
  end

  post 'register', to: 'users#register'
  post 'authenticate', to: 'users#authenticate'

end
