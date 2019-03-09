Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'smoothies#top'
  resources :foods
  resources :smoothies
  resource :user, except:[:index]
  resources :users, only:[:index]

   devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

end
