Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'smoothies#top'
  resource :foods
  resource :smoothies
  resource :users

  devise_for :users, controllers: {
  	sessions:      'users/sessions',
  	passwords:     'users/passwords',
  	registrations: 'users/registrations'
  }
end
