Rails.application.routes.draw do

  root 'home#index'
  
  resources :users do
    member do
      get 'profile'
      get 'matches'
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  match 'sign_out', to: 'sessions#destroy', via: :delete  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
