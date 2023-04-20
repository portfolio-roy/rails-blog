# Rails.application.routes.draw do
#   devise_for :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   root 'users#index'
#   resources :users, only: %i[index show] do
#     resources :posts, only: %i[index show new :destroy] do
#       resources :comments, only: %i[new create]
#       resources :likes, only: [:create]
#     end
#   end
# end
Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
      delete :delete_post, on: :member
    end
  end

  resources :comments, only: [:destroy]
  resources :posts, only: [:destroy]

  # Define CanCanCan routes
  namespace :admin do
    resources :users do
      member do
        put :change_role
      end
    end
  end
end
