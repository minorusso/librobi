Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  root to: 'posts#index'
  resources :posts do
    resources :comments
    resource :favorites, only: [:create, :destroy]
  end

  resources :books, only: [:show], param: :isbn do
    collection do
      get 'search'
      get 'rank'
    end
  end
  # get 'books/search'
  # get 'books/rank'
  # # post 'books/search', to: 'books#create'
  # get 'books/show'
  # get 'books/edit'


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
