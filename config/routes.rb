Rails.application.routes.draw do
  root to: "pages#home"
  get "/browse", to: "pages#browse"
  get "/how-to-play", to: "pages#howitworks"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :leagues do
    post 'join', on: :member
    delete 'leave', on: :member
    resources :rounds
    resources :posts
  end
  resources :rounds do
    resources :submissions
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
