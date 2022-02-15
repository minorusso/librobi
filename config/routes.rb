Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  
  resources :posts do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # root 'posts#index'
  root to: 'books#search'
  get 'books/search'
  # post 'books/search', to: 'books#create'
  get 'books/show'
  get 'books/edit'


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
