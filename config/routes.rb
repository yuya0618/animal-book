Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    collection do
      get 'list'
    end
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
