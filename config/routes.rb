Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'smoothies#top'
  resources :posts
  resources :foods
  resources :smoothies do
    resource :favorite, only: [:create, :destroy]
  end
  get 'smoothie/custom' => "smoothies#custom", as: "custom"
  namespace :admin do
    resources :users, only: [:index]
  end

   devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users
  get 'user/admin' => "users#admin", as: "admin"
end
