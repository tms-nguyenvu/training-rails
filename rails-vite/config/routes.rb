Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions'
  }
  resources :posts, only: [:index, :show]

  namespace :admin do


    resources :users
    resources :posts
    get "dashboard", to: "dashboard#index"
  end


  root "home#index"
end
