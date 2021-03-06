Rails.application.routes.draw do
  root 'home#index'
  devise_for :admins
  resources :contacts

  namespace :admin do 
    resources :contacts, only: %i[index show destroy] do
      collection { post :import }
    end
    resources :members
    resources :plans
  end

  get 'contact-us' => 'static_pages#contact_us'
  get 'about-us' => 'static_pages#about_us'
  get 'admin/contacts-csv', to: 'admin/contacts#importCSV'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
