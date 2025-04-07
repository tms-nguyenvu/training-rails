Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions'
  }
  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :users
    resources :posts
    resources :categories

    namespace :ai do
      get 'gemini', to: 'gemini#index'
      post 'gemini/generate', to: 'gemini#generate'
    end
  end

  # routes.rb

  root "home#index"

  match '*unmatched', to: 'errors#not_found', via: :all

end
