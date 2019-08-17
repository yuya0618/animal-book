Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
