Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, 
              controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'},
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'}

  resources :users, only: [:show]
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
  end

  
  
end
