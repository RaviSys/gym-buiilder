Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins
  resources :contacts

  namespace :admin do 
    get 'dashboard', to: 'sites#dashboard'
    resources :contacts, only: %i[index show destroy]
    resources :members
  end

  get 'contact-us' => 'static_pages#contact_us'
  get 'about-us' => 'static_pages#about_us'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
