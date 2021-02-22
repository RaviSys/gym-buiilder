Rails.application.routes.draw do
  root 'home#index'
  devise_for :admins
  resources :contacts

  namespace :admin do 
    resources :contacts, only: %i[index show destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
